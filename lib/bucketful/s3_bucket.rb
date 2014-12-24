module Bucketful
  class S3Bucket
    def initialize()
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
  end
end
