require 'odyssey'
require 'thor'

require_relative '../lib/flesch_kincaid_gl.rb'

class ReadabilityAction < Thor
  desc "index FILES", "Calculate the worst Flesch-Kincaid Grade Level for the supplied files"
  class_option :badges, :type => :boolean, default: false
  class_option :threshold, default: 0 
  def index(*filepaths)
    if filepaths.count == 0
      if options[:badges] 
        print("FK_LEGEND=no docs\nFK_COLOUR=green\nGF_LEGEND=no docs\nGF_COLOUR=green")
      else
        puts("No document files found")
      end
      exit
    end

    # this is done for us if files are supplied by workflow
    if !options[:badges]
      filepaths = filepaths.map { |filepath| File.directory?(filepath) ? Dir.glob(filepath+'/**/*') : filepath }
      filepaths = filepaths.flatten!.reject {|d| File.directory?(d) }
    end

    FleschKincaid.new(filepaths, options[:badges], options[:threshold].to_i)
  end
end

ReadabilityAction.start(ARGV)
