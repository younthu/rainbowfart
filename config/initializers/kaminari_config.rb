Kaminari.configure do |config|
  config.default_per_page = 25
  config.max_per_page = 100
  config.max_pages = 10,000,000 # active admin后台也用了kaminari
end
