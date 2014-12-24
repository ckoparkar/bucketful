# bucketful

A simple ruby client to zip folders and upload them to S3.

## Usage

`bundle exec rake zip_dirs['directory']`: zips all sub-dirs of *directory*
`bundle exec rake upload_all_zip['directory']`: uploads all zip file from *directory*
