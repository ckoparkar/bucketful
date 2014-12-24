# bucketful

A simple ruby client to zip folders and upload them to S3.

## Usage

`bundle exec rake zip_dirs['directory']`: zips all sub-dirs of *directory*
`bundle exec rake upload_all_zip['directory']`: uploads all zip file from *directory*
`bundle exec rake zip_and_upload['directory']`: zips and uploads all sub-dirs of *directory*
