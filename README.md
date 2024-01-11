# WayOfWorking::ReadingEase

<!-- HDI Way of Working: Badge Holder Start -->
[![HDI Way of Working](https://img.shields.io/badge/HDI-Way%20of%20Working-8169e3?labelColor=000)](https://healthdatainsight.github.io/way_of_working/)
[![Inclusive Language](https://github.com/HealthDataInsight/hdi_backpack_ros2_ws/actions/workflows/inclusive-language.yml/badge.svg)](https://github.com/HealthDataInsight/hdi_backpack_ros2_ws/actions/workflows/inclusive-language.yml)
![Reading Ease](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/bottlehall/d81400f704f3ba54c9564e038b66c271/raw/badgeFK.json)
<!-- HDI Way of Working: Badge Holder End -->

## Setup

The default behaviour is to check all files in the repository's `docs` folder on 'push'. To change this, edit the file `reading_ease.yml` in the `.github/workflow` folder.

## Execution

The workflow will return 'missing docs' if there are no documents in the folder `docs` but does not regard this as a failed workflow. The workflow runs the Flesh-Kincaid Grade Level check on each document. The 'worst' results are reported and badges are generated with descriptors of this result. If the result exceeds the allowed threshold, then the workflow reports a failure. The badge badkground colour reflects success (green) or failure (red).

TODO: Delete this and the text below, and describe your gem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/way_of_working/reading_ease`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/way_of_working-reading_ease. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/way_of_working-reading_ease/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WayOfWorking::ReadingEase project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/way_of_working-reading_ease/blob/main/CODE_OF_CONDUCT.md).
