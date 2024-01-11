Gem::Specification.new do |s|
  s.name = 'way_of_working_reading_ease'
  s.version     = '1.0.0'
  s.summary     = "Reports files' Flesch-Kincaid Grade Level"
  s.description = 'This gem is intended to be run from the command line, where it reports the Flesch-Kincaid Grade Level
for files as required. It is also used by the Way of Working workflow on commits to check files automatically.'
  s.authors     = ['Nick Robinson']
  s.email       = 'nick.robinson@healthdatainsight.org.uk'
  s.files       = ['lib/way_of_working_reading_ease.rb']
  s.homepage    =
    'https://github.com/HealthDataInsight/way_of_working/'
  s.license = 'MIT'
  s.metadata['rubygems_mfa_required'] = 'true'
  s.required_ruby_version = '>= 2.7.0'
end
