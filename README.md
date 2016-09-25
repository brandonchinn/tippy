# Pre-work - Tippy

Tippy is a tip calculator application for iOS.

Submitted by: Brandon Chinn

Time spent: 3 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Instead of tip amounts, user selects service satisifaction level
- [x] User can modify tip amounts, but are restricted to not cross over bounding satisfaction levels
- [x] Rounds total value to nearest dollar based on rounding method in settings
- [x] Displays actual tip percentage for rounding

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

![tippy](https://cloud.githubusercontent.com/assets/9141509/18817431/e927b5c8-8314-11e6-8514-39578de119e9.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Wanted to rename an IBAction method before submission, but no easy way to rename a method name without reconnecting to the UI
Planning on making improvements after initial submission with animations and saving data


## License

    Copyright [2016] [Brandon Chinn]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
