# frozen_string_literal: true

require 'thor'
require 'rainbow'

module WayOfWorking
  module ReadingEase
    module FleschKincaid
      # This generator runs the reading ease tests
      class Exec < Thor::Group
        desc 'This runs the reading ease tests on this project'

        def run_first
          @start_time = Time.now

          say(Rainbow("TODO: Implement Me\n").yellow)
        end
      end
    end
  end
end
