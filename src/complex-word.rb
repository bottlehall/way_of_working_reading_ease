#!/usr/bin/ruby
# frozen_string_literal: true

private

# module ComplexWord
def remove_common_endings(word)
  %w[es ing ed].map { |current| word = word.gsub("#{current} ", ' ') }
end

def count_triple_vowels(word)
  triple_vowels = %w[iou eau auy]
  syllables = triple_vowels.reduce(0) { |result, current| result + word.scan(/(?=#{current})/).count }
  triple_vowels.map { |current| word = word.gsub(current, '') }
  syllables
end

def count_double_vowels(word)
  double_vowels = %w[ae ai ao au ay ea ee ei eo eu ey ia ie io iu oa oe oi oo ou oy ua ue ui uo uy]
  syllables = double_vowels.reduce(0) { |result, current| result + word.scan(/(?=#{current})/).count }
  double_vowels.map { |current| word = word.gsub(current, '') }
  syllables
end

public

def complex?(word)
  single_vowels = %w[a e i o u y]
  syllables = count_triple_vowels(word) + count_double_vowels(word) + single_vowels.reduce(0) do |result, current|
                                                                        result + word.scan(/(?=#{current})/).count
                                                                      end
  syllables >= 3
end
# end
