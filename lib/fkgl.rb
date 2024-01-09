#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'interpret_score'

# Wrapper class to link Thor CLI with the code for each file being indexed.
class FleschKincaid
  def initialize(filepaths, _threshold = 0)
    scores = filepaths.map do |filepath|
      text = File.read(filepath)
      Odyssey.flesch_kincaid_gl(text, true)
    end

    worst_score = scores.max_by { |score| score['score'] }['score'].round
    colour = worst_score > 25 ? 'red' : 'green'
    print("FK_LEGEND=#{interpret_score(worst_score)}\nFK_COLOUR=#{colour}\n")
  end
end
