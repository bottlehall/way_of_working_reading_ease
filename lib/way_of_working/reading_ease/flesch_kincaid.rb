# frozen_string_literal: true

require 'way_of_working'
require_relative 'flesch_kincaid/exec'
require_relative 'flesch_kincaid/version'

module WayOfWorking
  Exec.register(ReadingEase::FleschKincaid::Exec, 'reading_ease', 'reading_ease',
  <<~LONGDESC)
    Description:
        This runs the reading ease tests on this project

    Example:
        way_of_working exec reading_ease
  LONGDESC
end
