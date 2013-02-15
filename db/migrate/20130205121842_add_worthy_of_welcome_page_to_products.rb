class AddWorthyOfWelcomePageToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :worthy_of_welcome_page, :boolean, :default => true
  end
end
