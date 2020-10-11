# frozen_string_literal: true

require 'csv'

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    source = CSV.parse(tsv, col_sep: "\t")

    source_headings = source[0]
    source_data = source.slice(1, source.length - 1)

    @data = source_data.map do |current_row|
      source_headings.each_with_index.reduce({}) do |accumulator, current_heading_with_index|
        heading, index = current_heading_with_index

        accumulator.merge({ heading => current_row[index] })
      end
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    attributes = @data[0].keys.map(&:to_s)

    CSV.generate(headers: true, col_sep: "\t") do |csv|
      csv << attributes

      @data.each do |row|
        csv << attributes.map { |attr| row[attr] }
      end
    end
  end
end
