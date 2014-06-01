#!/usr/bin/env ruby

require 'bundler/setup'
Bundler.require
require 'cgi'

dir = ARGV.shift
$index = ARGV.shift.to_i
$files = Dir.glob("#{dir}/*jpg")

get '/' do
  haml :index
end

get '/style.css' do
  scss :style
end

get '*' do
  open(CGI.unescape(request.path_info)).read
end

