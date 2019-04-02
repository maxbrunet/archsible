#!/usr/bin/env ruby

require 'json'
require 'yaml'

json = JSON.load(ARGF.read)
puts json.to_yaml
