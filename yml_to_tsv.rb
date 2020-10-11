#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'flip_flap'

usage = "Usage:  yml_to_tsv [yml_file] [tsv_file]\n"
raise ArgumentError, usage if ARGV.count < 2

yml_filename = ARGV[0]
tsv_filename = ARGV[1]

yml = File.read(yml_filename)
flipper = FlipFlap.new
flipper.take_yaml(yml)

File.write(tsv_filename, flipper.to_tsv)
