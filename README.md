# Way of Working Reading Ease

<!-- HDI Way of Working: Badge Holder Start -->
[![HDI Way of Working](https://img.shields.io/badge/HDI-Way%20of%20Working-8169e3?labelColor=000)](https://healthdatainsight.github.io/way_of_working/)
[![Inclusive Language](https://github.com/HealthDataInsight/hdi_backpack_ros2_ws/actions/workflows/inclusive-language.yml/badge.svg)](https://github.com/HealthDataInsight/hdi_backpack_ros2_ws/actions/workflows/inclusive-language.yml)
![badge](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/bottlehall/d81400f704f3ba54c9564e038b66c271/raw/badgeFK.json)
<!-- HDI Way of Working: Badge Holder End -->

## Setup

The default behaviour is to check all files in the repository's `docs` folder on 'push'. To change this, edit the file `readability.yml` in the `.github/workflow` folder.

## Execution

The workflow will return 'missing docs' if there are no documents in the folder `docs` but does not regard this as a failed workflow. The workflow runs Flesh-Kincaid and Gunning Fog checks on each document. The 'worst' results are reported and badges are generated with descriptors of this result. If the result exceeds the allowed threshold, then the workflow reports a failure. The badge badkground colour reflects success (green) or failure (red).
