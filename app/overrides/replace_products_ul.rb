Deface::Override.new( :virtual_path => "spree/shared/_products",
                        :replace => "ul#products",
                        :name => "replace_products_ul",
                        :text => %q{<ul id="products" class="inline product-listing" data-hook>
                                      <% products.each do |product| %>
                                        <% if product.on_display? %>
                                          <div id="product_<%= product.id %>" class="block" data-hook="products_list_item" itemscope itemtype="http://schema.org/Product">
                                            <div class="product-image">
                                              <%= link_to small_image(product, :itemprop => "image"), product, :itemprop => 'url' %>
                                            </div>
                                            <%= link_to truncate(product.name, :length => 50), product, :class => 'info', :itemprop => "name", :title => product.name %>
                                            <span class="price selling" itemprop="price"><%= product.price_in(current_currency).display_price %></span>
                                          </div>
                                        <% end %>
                                      <% end %>
                                      <% reset_cycle("classes") %>
                                    </ul>})