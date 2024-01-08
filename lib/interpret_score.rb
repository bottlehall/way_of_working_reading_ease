# frozen_string_literal: true

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
