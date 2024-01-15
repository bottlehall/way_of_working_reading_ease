# frozen_string_literal: true

require 'way_of_working'
require_relative 'reading_ease/exec'
require_relative 'reading_ease/version'

module WayOfWorking
  Exec.register(ReadingEase::Exec, 'reading_ease', 'reading_ease',
  <<~LONGDESC)
    Description:
        This runs the reading ease tests on this project

    Example:
        way_of_working exec reading_ease
  LONGDESC
end
