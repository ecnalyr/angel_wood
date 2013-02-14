Deface::Override.new( :virtual_path => "spree/shared/_footer",
                        :replace => "footer#footer",
                        :name => "replace_footer",
                        :text => %q{<footer>
                                        <div "id=footer-container">
                                          <div id="footer-left">
                                              <p><%= t :Designed_by  %> <%= link_to 'Lost Tie', 'http://www.losttie.com/' %></p>
                                          </div>
                                          <div id="footer-right">
                                              <p><%= link_to 'Care', main_app.care_url %> | <%= link_to 'Contact', main_app.contact_url %> | <%= link_to 'Requests', main_app.contact_url %></p>
                                          </div>
                                        </div>
                                    </footer>})