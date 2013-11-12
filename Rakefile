# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require "bundler/gem_tasks"
  require "bundler/setup"
  Bundler.require :default
rescue LoadError
end

$:.unshift("./lib/")
require './lib/afmotion-rocket'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'afmotion-rocket'
end
