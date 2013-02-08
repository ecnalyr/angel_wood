Deface::Override.new( :virtual_path => "spree/shared/_header",
                        :replace => "header#header",
                        :name => "replace_header",
                        :text => %q{<header id="header" class="row">
                                        <div class="navigation">
                                          <div class="custom_logo block"><h1><%= link_to AngelWood, root_path %></h1></div>
                                          <div class="block no_bottom"><h1><%= link_to "Gallery", root_path %></h1></div>
                                          <div class="block"><h1><%= link_to "Contact", root_path %></h1></div>
                                          <div class="block blank_space">
                                            <li id="link-to-cart" data-hook><%= link_to_cart %></li>
                                          </div>
                                          <div class="block blank_space"></div>
                                        </div>
                                    </header>})