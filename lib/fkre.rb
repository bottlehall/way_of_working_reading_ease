#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'interpret_score.rb'

# Wrapper class to link Thor CLI with the code for each file being indexed.
class FleschKincaid
  def initialize(filepaths, threshold = 0)
    scores = filepaths.map { |filepath|
      text = File.read(filepath)
      Odyssey.flesch_kincaid_gl(text, true)
    }

    worst_score = scores.max_by { |score| score['score'] }['score'].round
    print("FK_SCORE=#{worst_score}")
  end
end
