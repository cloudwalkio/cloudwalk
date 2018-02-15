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
  module Posxml
    class RakeTask < ::Rake::TaskLib
      include Cloudwalk::ManagerHelper
      include ::Rake::DSL if defined?(::Rake::DSL)

      attr_accessor :libs, :root_path, :main_out, :out_path, :outs

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
          task :build do |t, args|
            arguments = ARGV[1..-1]
            if arguments && path = arguments.first
              FileUtils.mkdir_p self.out_path
              xml, out  = self.libs.zip(self.outs).find { |file, out| file == path }

              posxml = xml2posxml(out)
              platform_call "cloudwalk compile -xml -o #{posxml} #{xml}"
              puts "=> #{File.size(posxml)} "
            else
              FileUtils.rm_rf self.out_path
              FileUtils.mkdir_p self.out_path

              self.libs.zip(self.outs).each do |file, out|
                posxml = xml2posxml(out)
                platform_call "cloudwalk compile -xml -o #{posxml} #{file}"
                puts "=> #{File.size(posxml)} "
              end
            end
          end

          desc "Deploy all compiled applications based in Cwfile.json"
          task :deploy => :build do
            if Cloudwalk::CwFileJson.setup
              if path = ARGV[1..-1].first
                xml, out  = self.libs.zip(self.outs).find { |file, out| file == path }
                posxmls = [xml2posxml(out)]
              else
                posxmls = self.outs.collect { |xml| xml2posxml(xml) }
              end
              Cloudwalk::Deploy.new(Cloudwalk::CwFileJson.cwfile,
                                    Cloudwalk::CwFileJson.lock).posxml(posxmls)
            end
          end

          desc "Update CwFile.json.lock"
          task :update do
            Cloudwalk::CwFileJson.delete_lock!
            Cloudwalk::CwFileJson.setup(true)
            Cloudwalk::CwFileJson.persist_lock!
          end

          desc "Translate from .xml to .rb, OUT_PATH expected"
          task :translate do
            raise "OUT_PATH not send" unless out = ENV["OUT_PATH"]

            if path = ARGV[1..-1].first
              xmls = [self.libs.find { |file| file == path }]
              xmls.zip([File.join(out, File.basename(xml2rb(xml)))])
            else
              xmls = self.libs.inject([]) do |array, lib|
                array << [lib, File.join(out, File.basename(xml2rb(xml)))]
              end
            end

            xmls.each do |xml, out|
              sh "cloudwalk compile -txml -o #{out} #{xml}"
            end
          end
        end

        task :default => "cloudwalk:build"
      end
    end
  end
end

