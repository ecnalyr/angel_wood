class WelcomeController < Spree::StoreController
    layout 'application'
    respond_to :html
  def index
    @searcher = Spree::Config.searcher_class.new(params)
    @searcher.current_user = try_spree_current_user
    @searcher.current_currency = current_currency
    @products = @searcher.retrieve_products.limit(8).order('random()')
    respond_with(@products)
  end
end
