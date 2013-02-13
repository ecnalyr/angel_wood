Spree::Image.class_eval do
  attachment_definitions[:attachment][:styles] = {
    :mini => '48x48>', # thumbs under image
    :small => '190x190#', # images on category view
    :product => '575x575>', # full product image
    :large => '600x600>'  # light box image
  }
end