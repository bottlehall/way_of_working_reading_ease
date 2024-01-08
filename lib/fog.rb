#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'interpret_score'

# Wrapper class to link Thor CLI with the code for each file being indexed.
class FogIndex
  def initialize(filepaths, _threshold = 0)
    scores = filepaths.map do |filepath|
      text = File.read(filepath)
      fog_index(text.downcase)
    end
    worst_score = scores.max.round
    colour =  worst_core > 25 ? 'red' : 'green'
    print("GF_LEGEND=#{interpret_score(worst_score)}\nGF_COLOUR=#{colour}")
  end

  def calculate_index(sentence_count, word_count, complex_word_count)
    # puts("s=#{sentence_count}, w=#{word_count}, x=#{complex_word_count}")
    words_per_sentence = sentence_count.positive? ? word_count.to_f / sentence_count : word_count
    pc_complex_words = word_count.positive? ? (complex_word_count.to_f / word_count) * 100.0 : 0.0
    (words_per_sentence + pc_complex_words) * 0.4
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
    sentences = text.split(/[.?!;-]\s/)
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
