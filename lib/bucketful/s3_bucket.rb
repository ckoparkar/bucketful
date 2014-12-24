module Bucketful
  class S3Bucket
    def initialize(params)
      aws_credentials = {'access_key_id' => params.fetch(:aws_key),
                         'secret_access_key' => params.fetch(:aws_secret)}

      @s3 = AWS::S3.new(aws_credentials)
      @s3_bucket = @s3.buckets[params.fetch(:s3_bucket)]
    end

    # Uploads all .zip files from a dir
    # @param [String] name of dir to upload .zip
    def upload_all_zip(directory)
      zips = Dir.glob("#{directory}/*").select {|file| file =~ /.zip/}
      zips.each { |zip| upload(zip)}
    end

    # Creates a zip for all dirs in directory
    # @param [String] name of the dir whose contents
    #                 we have to zip
    def zip_dirs(directory)
      sub_dirs(directory).each do |dir|
        Archive::Zip.archive("#{dir}.zip", dir)
      end
    end

    private

    def sub_dirs(dir)
      Dir.glob("#{dir}/*").select {|file| File.directory? file}
    end

    def upload(file_name)
      puts "Uploading #{file_name} to S3 Bucket #{@s3_bucket.name}"
      @s3_bucket.objects[file_name].write(file: file_name)
    end
  end
end
