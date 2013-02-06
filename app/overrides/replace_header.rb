Deface::Override.new( :virtual_path => "spree/shared/_header",
                        :replace => "header#header",
                        :name => "replace_header",
                        :text => %q{<header id="header" class="row">
                                        <div class="navigation">
                                          <div class="custom_logo block"><%= link_to AngelWood, root_path %></div>
                                          <div class="block blank_space"></div>
                                          <div class="block no_bottom"><%= link_to "Gallery", root_path %></div>
                                          <div class="block blank_space">
                                            <li id="link-to-cart" data-hook><%= link_to_cart %></li>
                                          </div>
                                          <div class="block"><%= link_to "Contact", root_path %></div>
                                        </div>
                                    </header>})