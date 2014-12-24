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
  dirs = args[:dir].split(' ')
  bucket = Bucketful::S3Bucket.new(aws_key: ENV['AWS_KEY'],
                                   aws_secret: ENV['AWS_SECRET'],
                                   s3_bucket: ENV['S3_BUCKET'])

  dirs.each do |dir|
    bucket.zip_dirs(dir)
  end
end


desc 'Upload all zip files to S3'
task :upload_all_zip, :dir do |_t, args|
  check_env_vars
  dirs = args[:dir].split(' ')
  bucket = Bucketful::S3Bucket.new(aws_key: ENV['AWS_KEY'],
                                   aws_secret: ENV['AWS_SECRET'],
                                   s3_bucket: ENV['S3_BUCKET'])
  dirs.each do |dir|
    bucket.upload_all_zip(dir)
  end
end

desc 'Zip dirs and then upload them'
task :zip_and_upload, :dir do |_t, args|
  Rake::Task["zip_dirs"].invoke(args[:dir])
  Rake::Task["upload_all_zip"].invoke(args[:dir])
end

desc 'Verify if all zip files are uploaded'
task :verify_uploads, :dir do |_t, args|
  check_env_vars
  dirs = args[:dir].split(' ')
  bucket = Bucketful::S3Bucket.new(aws_key: ENV['AWS_KEY'],
                                   aws_secret: ENV['AWS_SECRET'],
                                   s3_bucket: ENV['S3_BUCKET'])
  dirs.each do |dir|
    bucket.verify_uploads(dir)
  end
end
