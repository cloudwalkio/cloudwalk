#!/usr/bin/env rake

require 'rake'
require 'rake/tasklib'
require 'fileutils'
require 'bundler/setup'

# Tasks:
# cloudwalk:build (Will build mruby or posxml application)
# cloddwalk:deploy (Send Posxml or Ruby application)
# cloddwalk:update (Update Cwfile.lock)
# cloudwalk:package - maybe not

module Cloudwalk
  class RakeTask < ::Rake::TaskLib
    include ::Rake::DSL if defined?(::Rake::DSL)

    attr_accessor :libs, :root_path, :main_out, :out_path

    def initialize
      yield self if block_given?

      @libs      ||= FileList['lib/*.xml']
      @root_path ||= "./"
      @out_path  ||= File.join(root_path, "out", "shared")
      @outs      ||= @libs.pathmap("%{lib,#{@out_path}}p")

      define
    end

    def platform_call(command)
      if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM)
        sh("bash -c \"#{command}\"")
      else
        sh command
      end
    end

    def define
      namespace :cloudwalk do
        desc "Compile posxml"
        task :build do
          FileUtils.rm_rf self.out_path
          FileUtils.mkdir_p self.out_path
          self.libs.zip(self.outs).each do |file, out|
            posxml = CwFileJson.xml2posxml(out)
            puts "cloudwalk compile -xml -o #{posxml} #{file}"
            platform_call "cloudwalk compile -xml -o #{posxml} #{file}"
          end
        end

        desc "Deploy all compiled applications based in Cwfile.json"
        task :deploy => :build do
          if Cloudwalk::CwFileJson.setup
            Cloudwalk::CwFileJson.deploy(self.outs)
          end
        end

        desc "Update CwFile.json.lock"
        task :update do
          Cloudwalk::CwFileJson.delete_lock!
          Cloudwalk::CwFileJson.setup(true)
          Cloudwalk::CwFileJson.persist_lock!
        end

        task :default => :build
      end
    end
  end
end

