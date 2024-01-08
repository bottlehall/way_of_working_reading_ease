#!/usr/bin/ruby
# frozen_string_literal: true

# Wrapper class to link Thor CLI with the code for each file being indexed.
class FleschKincaid
  def initialize(filepaths, threshold = 0)
    scores = filepaths.map { |filepath|
      text = File.read(filepath)
      Odyssey.flesch_kincaid_gl(text, true)
    }

    worst_score = scores.min_by { |score| score['score'] }['score'].round
    print("FK_SCORE=#{worst_score}")
    # puts(scores.sort_by! { |score| score['score'] })
    # puts "#{filepath}: #{interpretation}" unless interpretation.nil?
  end

  def interpret_flesch_kincaid(value, threshold)
    return if value < threshold

    levels = { 16 => 'graduate', 12 => 'undergraduate', 8 => 'secondary', 6 => 'KS4', 0 => 'KS1-3' }
    description = ''
    levels.each do |level, desc|
      if value.round > level
        description = desc
        break
      end
    end
    "#{description} (#{value.round})"
  end
end
