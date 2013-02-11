Deface::Override.new( :virtual_path => "spree/shared/_header",
                        :replace => "header#header",
                        :name => "replace_header",
                        :text => %q{<header id="header" class="row">
                                        <div class="navigation">
                                          <%= link_to root_path do %>
                                            <div class="block" id="logo"><h1>AngelWood</h1></div>
                                          <% end %>
                                          <%= link_to root_path do %>
                                            <div class="block no_bottom" id="gallery"><h1>Gallery</h1></div>
                                          <% end %>
                                          <%= link_to "contact" do %>
                                            <div class="block" id="contact"><h1>Contact</h1></div>
                                          <% end %>
                                          <div class="block blank_space">
                                            <li id="link-to-cart" data-hook><%= link_to_cart %></li>
                                          </div>
                                          <div class="block blank_space"></div>
                                        </div>
                                    </header>})