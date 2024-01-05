#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'complex-word'

class FogIndex
  def initialize(filepaths, threshold = 0)
    filepaths.each do |filepath|
      text = File.read(filepath)
      interpretation = interpret_fog_index(fog_index(text), threshold)
      puts "#{filepath}: #{interpretation}" unless interpretation.nil?
    end
  end
  
  def calculate_index(sentence_count, word_count, complex_word_count)
    # puts("s=#{sentence_count}, w=#{word_count}, x=#{complex_word_count}")
    words_per_sentence = sentence_count.positive? ? word_count.to_f / sentence_count : word_count
    pc_complex_words = word_count.positive? ? (complex_word_count.to_f / word_count) * 100.0 : 0.0
    (words_per_sentence + pc_complex_words) * 0.4
  end
  
  def interpret_fog_index(value, threshold)
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
  
  def fog_index(text)
    word_count = sentence_count = complex_word_count = 0
    in_word = false
    word = ''
  
    text.chars.each do |ch|
      if ch == ' ' || '?!.-;'.scan(ch).count.positive?
        if in_word
          word_count += 1
          complex_word_count += 1 if ComplexWord.new(word).complex?
          in_word = false
          word = ''
        end
        sentence_count += 1 if ch != ' '
      elsif ch.match?(/[[:alpha:]]/)
        in_word = true
        word += ch
      end
    end
  
    calculate_index(sentence_count, word_count, complex_word_count)
  end
end
