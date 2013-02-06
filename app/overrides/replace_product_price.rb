Deface::Override.new( :virtual_path => "spree/products/_cart_form",
                        :replace => "[data-hook='product_price']",
                        :name => "replace_product_price",
                        :text => %q{<div data-hook="product_price" class="columns five <% if !@product.has_variants? %> alpha <% else %> omega <% end %>">
        
                                      <div id="product-price">
                                        <h6 class="product-section-title"><%= t(:price) %></h6>
                                        <div><span class="price selling" itemprop="price"><%= @product.price_in(current_currency).display_price %></span></div>
                                      </div>

                                      <div class="add-to-cart">
                                        <% if @product.on_sale? %>      
                                          <%= number_field_tag (@product.has_variants? ? :quantity : "variants[#{@product.master.id}]"),
                                            1, :class => 'title', :in => 1..@product.on_hand, :min => 1 %>
                                          <%= button_tag :class => 'large primary', :id => 'add-to-cart-button', :type => :submit do %>
                                            <%= t(:add_to_cart) %>
                                          <% end %>
                                        <% else %>
                                          <%= content_tag('strong', t(:sold)) %>
                                        <% end %>
                                      </div>
                                    </div>})