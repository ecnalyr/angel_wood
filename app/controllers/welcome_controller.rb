class WelcomeController < Spree::StoreController
    layout 'application'
    respond_to :html
  def index
    @searcher = Spree::Config.searcher_class.new(params)
    @searcher.current_user = try_spree_current_user
    @searcher.current_currency = current_currency
    @products = @searcher.retrieve_products.where(:worthy_of_welcome_page => true).limit(8).order('random()')
    if @products.size < 8 # if there are fewer than 8 products marked as worthy_of_welcome_page
      @products = @searcher.retrieve_products.limit(8).order('random()')
    end
    respond_with(@products)
  end
end
