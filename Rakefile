require_relative 'lib/bucketful.rb'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new
task default: [:cucumber]

desc 'Zip all sub-dirs of a dir'
task :zip_dirs, :dir do |_t, args|
  bucket = Bucketful::S3Bucket.new
  bucket.zip_dirs(args[:dir])
end
