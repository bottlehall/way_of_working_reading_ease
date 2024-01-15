# frozen_string_literal: true

require_relative 'lib/way_of_working/reading_ease/flesch_kincaid/version'

Gem::Specification.new do |spec|
  spec.name = 'way_of_working-reading_ease-flesch_kincaid'
  spec.version = WayOfWorking::ReadingEase::FleschKincaid::VERSION
  spec.authors = ['Nick Robinson', 'Tim Gentry']
  spec.email = ['5624261+bottlehall@users.noreply.github.com',
                '52189+timgentry@users.noreply.github.com']

  spec.summary = 'Way of Working add-on for reading ease tests'
  spec.description = 'This gem adds Flesch–Kincaid reading ease test to the way of working ' \
                     'command line tool.'
  spec.homepage = 'https://github.com/HealthDataInsight/way_of_working-reading_ease-flesch_kincaid'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/HealthDataInsight/way_of_working-reading_ease-flesch_kincaid'
  spec.metadata['changelog_uri'] = 'https://github.com/HealthDataInsight/way_of_working-reading_ease-flesch_kincaid/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'way_of_working', '~> 1.0'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
