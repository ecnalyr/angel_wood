Deface::Override.new( :virtual_path => "spree/products/show",
                        :replace => "[data-hook='product_show']",
                        :name => "replace_product_show",
                        :text => %q{<div data-hook="product_show" itemscope itemtype="http://schema.org/Product">
                                      <% @body_id = 'product-details' %>

                                      <div class="product_left" data-hook="product_left_part">
                                        <div class="row" data-hook="product_left_part_wrap">

                                          <div id="product-images" data-hook="product_images">
                                            <div id="main-image" data-hook>
                                              <%= render :partial => 'image' %>
                                            </div>
                                            <div id="thumbnails" data-hook>
                                              <%= render :partial => 'thumbnails' %>
                                            </div>
                                          </div>

                                          <div data-hook="product_properties">
                                            <%= render :partial => 'properties' %>
                                          </div>
                                        
                                        </div>
                                      </div>

                                      <div class="product_right" data-hook="product_right_part">
                                        <div class="row" data-hook="product_right_part_wrap">

                                          <div id="product-description" data-hook="product_description">

                                            <h1 class="product-title" itemprop="name"><%= accurate_title %></h1>

                                            <div itemprop="description" data-hook="description">
                                              <%= product_description(@product) rescue t(:product_has_no_description) %>
                                            </div>

                                            <div id="cart-form" data-hook="cart_form">
                                              <%= render :partial => 'cart_form' %>
                                            </div>

                                          </div>

                                          <%= render :partial => 'taxons' %>

                                        </div>
                                      </div>

                                    </div>})