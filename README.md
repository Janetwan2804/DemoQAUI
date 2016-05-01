# DemoQAUI

## Test Prerequisites
  - Please have ruby 2.0.0 installed on machine
  - Running this test can be fine in command line but will look better in an IDE such as RubyMine
  - Please download the required gems from gemfile
  - The tests run on chrome browser so make sure you have a chrome executable on your machine for the UI tests

## Assumptions Made
  - These tests were written using multiple ways to identify elements such as xpath, id , class and name. Ideally we wouldn't want to use xpath at least not the absolute path because that can change and is not stable.
  - These tests were also written rather quickly and simple to get the job done
  - This repo originally contained only UI tests, but then decided to merge the API and UI into one repo
  - To run the api tests, please run the entire feature file as stationid gets passed to the second test in API

## Issues
  - I couldn't figure out how to create a login and password for the second account test in UI so i've skipped that test. I found a "register" under the meta section but I think that is for the actual website and not the Iphone app store. Please let me know if I am wrong and I can push the second test to git!



