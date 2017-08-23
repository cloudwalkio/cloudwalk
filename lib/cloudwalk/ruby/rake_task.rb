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

      def initialize
        define
      end

      def define
        namespace :cloudwalk do
          desc "Compile ruby application"
          task :build => :build

          desc "Package Build"
          task :package => :package

          desc "Deploy all compiled applications based in Cwfile.json"
          task :deploy => "cloudwalk:package" do
            if Cloudwalk::CwFileJson.setup
              Cloudwalk::Posxml::Deploy.new(Cloudwalk::CwFileJson.cwfile,
                                            Cloudwalk::CwFileJson.lock).perform
            end
          end

          desc "Update CwFile.json.lock"
          task :update do
            Cloudwalk::CwFileJson.delete_lock!
            Cloudwalk::CwFileJson.setup(true)
            Cloudwalk::CwFileJson.persist_lock!
          end
        end

        task :default => "cloudwalk:build"
      end
    end
  end
end

