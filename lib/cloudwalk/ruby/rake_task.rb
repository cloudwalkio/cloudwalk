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
  module Ruby
    class RakeTask < ::Rake::TaskLib
      include Cloudwalk::ManagerHelper
      include ::Rake::DSL if defined?(::Rake::DSL)

      attr_accessor :debug, :debug_flag

      def initialize
        yield self if block_given?

        @debug    ||= false
        @debug_flag = @debug ? '-g' : ''

        define
      end

      def define
        namespace :cloudwalk do
          desc "Compile ruby application"
          task :build do
            Rake::Task[:build].invoke
          end

          desc "Package Build"
          task :package do
            Rake::Task[:package].invoke
          end

          desc "Deploy all compiled applications based in Cwfile.json"
          task :deploy => "cloudwalk:package" do
            if Cloudwalk::CwFileJson.setup
              Cloudwalk::Deploy.new(Cloudwalk::CwFileJson.cwfile,
                                    Cloudwalk::CwFileJson.lock).ruby
            end
          end

          desc "Update CwFile.json.lock"
          task :update do
            Cloudwalk::CwFileJson.delete_lock!
            Cloudwalk::CwFileJson.setup(true)
            Cloudwalk::CwFileJson.persist_lock!
          end

          desc "Compile each .rb to .mrb"
          task :single_build do
            FileUtils.mkdir_p "./out/shared"

            files = FileList["./lib/*"].zip(FileList["./lib/*"].pathmap("./out/shared/%n.mrb"))
            files.each do |file,out|
              next if file == "./lib/main.rb"
              if File.file?(file)
                sh "cloudwalk compile #{self.debug_flag} -o #{out} #{file}"
              end
            end
          end

          desc "Create zipfile from all .mrb"
          task :single_package do
            require "archive/zip"
            FileUtils.rm_f "./out/mrb.zip"
            Archive::Zip.archive "./out/mrb.zip", FileList["./out/shared/*.mrb"].to_a
          end
        end

        task :default => "cloudwalk:build"
      end
    end
  end
end

