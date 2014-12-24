require_relative 'lib/bucketful.rb'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new
task default: [:cucumber]

def check_env_vars
  if ENV['AWS_KEY'].nil? || ENV['AWS_SECRET'].nil? || ENV['S3_BUCKET'].nil? then
    puts "Not all environment variables have been set."
    exit 1
  end
end

desc 'Zip all sub-dirs of a dir'
task :zip_dirs, :dir do |_t, args|
  check_env_vars
  bucket = Bucketful::S3Bucket.new(aws_key: ENV['AWS_KEY'],
                                   aws_secret: ENV['AWS_SECRET'],
                                   s3_bucket: ENV['S3_BUCKET'])
  bucket.zip_dirs(args[:dir])
end


desc 'Upload all zip files to S3'
task :upload_all_zip, :dir do |_t, args|
  check_env_vars
  bucket = Bucketful::S3Bucket.new(aws_key: ENV['AWS_KEY'],
                                   aws_secret: ENV['AWS_SECRET'],
                                   s3_bucket: ENV['S3_BUCKET'])
  bucket.upload_all_zip(args[:dir])
end
