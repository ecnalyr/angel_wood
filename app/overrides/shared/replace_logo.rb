Deface::Override.new( :virtual_path => "spree/shared/_header",
                        :replace => "figure#logo",
                        :name => "replace_logo",
                        :text => %q{<figure id="logo" class="columns six" data-hook>AngelWood</figure>})