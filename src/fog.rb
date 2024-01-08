#!/usr/bin/ruby
# frozen_string_literal: true

class FogIndex
  def initialize(filepaths, threshold = 0)
    filepaths.each do |filepath|
      text = File.read(filepath)
      interpretation = interpret_fog_index(fog_index(text.downcase), threshold)
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
  
  def syllable_count(word)
    word.downcase!
    return 1 if word.length <= 3
    word.sub!(/(?:[^laeiouy]es|ed|[^laeiouy]e)$/, '')
    word.sub!(/^y/, '')
    word.scan(/[aeiouy]{1,2}/).size
  end

  def fog_index(text)
    complex_word_count = 0
    word_count = 0
    sentences = text.split /[\.\?\!;\-][\s]/
    sentences.each do |sentence|
      words = sentence.split(/[\s|,]+/)
      words.each do |word|
        complex_word_count += 1 if syllable_count(word) >= 3
      end
      word_count += words.count
    end

    calculate_index(sentences.count, word_count, complex_word_count)
  end
end
