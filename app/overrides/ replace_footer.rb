Deface::Override.new( :virtual_path => "spree/shared/_footer",
                        :replace => "footer#footer",
                        :name => "replace_footer",
                        :text => %q{<footer>
                                        <div footer-left>
                                            <p><%= t :Designed_by  %> <%= link_to 'Lost Tie', 'http://www.losttie.com/' %></p>
                                        </div>
                                    </footer>})