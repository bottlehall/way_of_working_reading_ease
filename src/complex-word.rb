#!/usr/bin/ruby
# frozen_string_literal: true

# Estimates the number of syllables in the supplied word
class ComplexWord
  def initialize(word)
    @word = word
  end

  private

  def remove_common_endings
    # THIS IS NOT YET CORRECT!!!
    %w[es ing ed].map { |current| @word = @word.gsub("#{current} ", ' ') }
  end

  def count_triple_vowels
    triple_vowels = %w[iou eau auy]
    syllables = triple_vowels.reduce(0) { |result, current| result + @word.scan(/(?=#{current})/).count }
    triple_vowels.map { |current| @word = @word.gsub(current, '') }
    syllables
  end

  def count_double_vowels
    double_vowels = %w[ae ai ao au ay ea ee ei eo eu ey ia ie io iu oa oe oi oo ou oy ua ue ui uo uy]
    syllables = double_vowels.reduce(0) { |result, current| result + @word.scan(/(?=#{current})/).count }
    double_vowels.map { |current| @word = @word.gsub(current, '') }
    syllables
  end

  public

  def complex?
    remove_common_endings
    single_vowels = %w[a e i o u y]
    syllables = count_triple_vowels + count_double_vowels + single_vowels.reduce(0) do |result, current|
                                                              result + @word.scan(/(?=#{current})/).count
                                                            end
    # puts("#{@word} is #{syllables}")
    syllables >= 3
  end
end
