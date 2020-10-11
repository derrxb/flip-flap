#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'flip_flap'

usage = 'Usage:  tsv_to_yml [TSV_file] [YML_file]\n'
raise ArgumentError, usage if ARGV.count.zero?

tsv_filename = ARGV[0]
yml_filename = ARGV[1]

tsv = File.read(tsv_filename)
flipper = FlipFlap.new
flipper.take_tsv(tsv)

File.write(yml_filename, flipper.to_yaml)
