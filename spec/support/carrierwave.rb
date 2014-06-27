if Rails.env.test? || Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  # use different dirs when testing
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/public/tmp"
      end

      def store_dir
        "#{Rails.root}/public/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end
  CarrierWave.configure do |config|
      config.root = "#{Rails.root}/public/" 
   end
end