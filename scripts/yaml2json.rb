#!/usr/bin/env ruby

require 'json'
require 'yaml'

yaml = YAML.load(ARGF.read)
puts JSON.pretty_generate(yaml, :indent => '    ')
