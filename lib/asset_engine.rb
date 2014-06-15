if Gem::Specification::find_all_by_name('carrierwave').any?
  require 'asset_engine/carrier_wave'
elsif Gem::Specification::find_all_by_name('paperclip').any?
  require 'asset_engine/paperclip'
end
