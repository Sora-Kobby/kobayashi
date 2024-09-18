CarrierWave.configure do |config|
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.store_dir = "#{Rails.root}/public/uploads"
end