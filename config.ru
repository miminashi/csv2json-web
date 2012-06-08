#coding:utf-8
require 'rubygems'
require 'bundler/setup'

require File.expand_path('app.rb', File.dirname(__FILE__))

run Rack::URLMap.new('/' => Csv2Json.new)

