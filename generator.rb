#!/usr/bin/env ruby

require 'pry'
require 'json'

Dir['./lib/**/*.rb'].each { |file| require file }

Generate.new(ARGV[0], ARGV[1]).process
