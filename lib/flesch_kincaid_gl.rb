#!/usr/bin/ruby
# frozen_string_literal: true

# Wrapper class to link Thor CLI with the code for each file being indexed.
class FleschKincaid
  def initialize(filepaths, badges = false, threshold = 0)
    scores = filepaths.map do |filepath|
      text = File.read(filepath)
      score = Odyssey.flesch_kincaid_gl(text, true)
      if !badges && score['score'] >= threshold
        puts("#{filepath} #{score['score']}")
      else
        score
      end
    end

    return unless badges

    worst_score = scores.max_by { |score| score['score'] }['score'].round
    colour = worst_score > 25 ? 'red' : 'green'
    puts("FK_LEGEND=#{interpret_score(worst_score)}\nFK_COLOUR=#{colour}")
  end
end

def interpret_score(value)
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
