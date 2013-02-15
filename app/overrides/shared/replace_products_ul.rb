Deface::Override.new( :virtual_path => "spree/shared/_products",
                        :replace => "ul#products",
                        :name => "replace_products_ul",
                        :text => %q{<ul id="products" class="inline product-listing" data-hook>
                                      <% products.each do |product| %>
                                        <% if product.on_display? %>
                                          <div id="product_<%= product.id %>" class="block product" data-hook="products_list_item" itemscope itemtype="http://schema.org/Product">
                                            <div class="product-image">
                                              <%= link_to small_image(product, :itemprop => "image"), product, :itemprop => 'url' %>
                                              <% if product.on_sale? %> 
                                                <div class="for-sale">
                                                  <%= link_to image_tag("for-sale.png"), product, :itemprop => 'url' %>
                                                </div>
                                              <% end %>
                                            </div>
                                          </div>
                                        <% end %>
                                      <% end %>
                                    </ul>})