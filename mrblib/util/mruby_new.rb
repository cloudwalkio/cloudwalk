module Util
  class MrubyNew
    def self.run(name, cwfile)
      Dir.mkdir(name) unless Dir.exist?(name)
      Dir.chdir(name) do
        write_file("README.md", readme)
        write_file(".gitignore", gitignore)
        write_file("Gemfile", gemfile)
        write_file("Cwfile.json", cwfile_json(name, cwfile))
        write_file("Rakefile", rakefile)
        create_dir_p("lib")
        write_file("lib/main.rb", main)
        create_dir_p("test/unit")
        create_dir_p("test/integration")
        write_file("test/test_helper.rb", helper)
        write_file("test/unit/#{name}_test.rb", unit(name))
        write_file("test/integration/#{name}_test.rb", integration)
      end
    end

    def self.readme
      <<IGNORE
# Funky Application

## Usage

### Setup

With Ruby installed and repository cloned, execute in root of repo:

    bundle install # Install CloudWalk CLI
    
### Files and Directories

- `lib/` Contain .rb files that will be compiled.
- `test/` Contain all ruby files for test.
- `Gemfile/Gemfile.lock` Manage CloudWalk CLI version and any other Ruby gem, do not touch at `Gemfile.lock`
- `Cwfile.json` Manage Application attributes, application version and application modules versions.
- `Cwfile.json.lock` Contain the id's for all versions managed by `Cwfile.json`. **DO NOT MODIFY THIS FILE, IT'S AUTOMATICA GENERATED**
- `Rakefile` Defition of task files.
- `out` Contain the .mrb files compiled by tasks.
    
### Compiling

Compile all ./lib/**/*.rb files:

    bundle exec rake cloudwalk:build
    # or
    bundle exec rake
    
### Deploying

Deploying all out files:

    bundle exec rake cloudwalk:build <lib/path/to/file.xml>
    
### Testing

Execute all tests

    bundle exec rake test

Execute unit tests

    bundle exec rake test:unit

Execute integration tests

    bundle exec rake test:integration

Execute unique test

    bundle exec rake test </path/to/test/file_test.rb>
IGNORE
    end

    def self.gitignore
      <<IGNORE
out/
IGNORE
    end

    def self.create_dir_p(dir)
      dir.split("/").inject("") do |parent, base|
        new_dir =
          if parent == ""
            base
          else
            "#{parent}/#{base}"
          end

        create_dir(new_dir)

        new_dir
      end
    end

    def self.create_dir(dir)
      if Dir.exist?(dir)
        puts "  skip    #{dir}"
      else
        puts "  create  #{dir}/"
        Dir.mkdir(dir)
      end
    end

    def self.write_file(file, contents)
      puts "  create  #{file}"
      File.open(file, 'w') {|file| file.puts contents }
    end

    def self.cwfile_json(name, cwfile)
      <<CWFILE
{
  \"name\":\"#{name}\",
  \"runtime\": \"ruby\",
  \"modules\":{
  },
  \"version\":\"1.0.0\",
  \"authorizer_url\":\"#{cwfile["authorizer_url"]}\",
  \"description\":\"#{cwfile["description"]}\",
  \"pos_display_label\":\"#{cwfile["pos_display_label"]}\"
}
CWFILE
    end

    def self.gemfile
      <<GEMFILE
source 'https://rubygems.org'

gem 'da_funk'
gem 'cloudwalk'
gem 'rake'
GEMFILE
    end

    def self.rakefile
      <<RAKEFILE
#!/usr/bin/env rake

require 'rake'
require 'fileutils'
require 'bundler/setup'

Bundler.require(:default)

Cloudwalk::Ruby::RakeTask.new

DaFunk::RakeTask.new do |t|
  t.mrbc  = "cloudwalk compile"
  t.mruby = "cloudwalk run -b"
end
RAKEFILE
    end

    def self.main
      <<MAIN
class Main < Device
  def self.call
    puts "Hello World!"
    getc
    true
  end

  def self.foo
    :foo
  end

  def self.version
    "0.0.1"
  end
end
MAIN
    end

    def self.helper
      <<HELPER
ROOT_PATH = File.expand_path("../")
APP_NAME = File.basename(ROOT_PATH)

$LOAD_PATH.unshift "./\#{APP_NAME}"
require 'da_funk'

DaFunk::Test.configure do |t|
  t.root_path = ROOT_PATH
  t.name      = APP_NAME
end
HELPER
    end

    def self.integration
      <<INTEGRATION
class MainTest < DaFunk::Test.case
  def test_true
    assert Main.call
  end
end
INTEGRATION
    end

    def self.unit(name)
      <<UNIT
class #{Util.camelize(name)}Test < DaFunk::Test.case
  def test_foo0
    assert_equal :foo, Main.foo
  end

  def test_foo1
    assert_equal :foo, Main.foo
  end
end
UNIT
    end
  end
end