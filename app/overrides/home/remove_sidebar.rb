Deface::Override.new( :virtual_path => "spree/home/index",
                        :remove => "code[erb-silent]:contains('content_for')",
                        :remove => "[data-hook='homepage_sidebar_navigation']",
                        :name => "remove_sidebar",
                        )
