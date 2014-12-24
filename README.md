# bucketful [![Build Status](https://travis-ci.org/cskksc/bucketful.svg)](https://travis-ci.org/cskksc/bucketful)

A simple ruby client to zip folders and upload them to S3.

## Usage:

Takes AWS S3 credentials from environment vars:
* `AWS_KEY` - aws key
* `AWS_SECRET` - aws secret
* `S3_BUCKET` - bucket name

* `bundle exec rake zip_dirs['directory']`: zips all sub-dirs of *directory*
* `bundle exec rake upload_all_zip['directory']`: uploads all zip file from *directory*
* `bundle exec rake zip_and_upload['directory']`: zips and uploads all sub-dirs of *directory*
* `bundle exec rake verify_uploads['directory']`: checks if all zip files from *directory* are uploaded to S3

##### To use for multiple directories:

* `bundle exec rake zip_dirs['directory1 directory2']`: zips all sub-dirs of *directories*
* `bundle exec rake upload_all_zip['directory1 directory2']`: uploads all zip file from *directories*
* `bundle exec rake zip_and_upload['directory1 directory2']`: zips and uploads all sub-dirs of *directories*
* `bundle exec rake verify_uploads['directory1 directory2']`: checks if all zip files from *directories* are uploaded to S3

For users on zsh, run:
noglob bundle exec rake ...
