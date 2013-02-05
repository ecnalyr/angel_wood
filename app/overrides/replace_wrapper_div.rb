Deface::Override.new( :virtual_path => "spree/layouts/spree_application",
                        :replace => "div#wrapper",
                        :name => "replace_wrapper_div",
                        :text => %q{<div id="wrapper" class="row" data-hook>


                                        <%= flash_messages %>
                                        <%= yield %>

                                    </div>})