# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  # config.site_name = "Spree Demo Site"
  config.products_per_page = 15
  config.allow_ssl_in_production = true
  config.use_s3 = true
  config.s3_bucket = 'angelwoodstandard'
  config.s3_access_key = 'AKIAJ3KJEPL35KTPHDLA'
  config.s3_secret = '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'
  config.s3_protocol = 'http'
  config[:attachment_styles] =  "{\"mini\":\"48x48>\",\"small\":\"190x190\",\"product\":\"575x575\",\"large\":\"600x600>\"}"
end

Spree.user_class = "Spree::User"
