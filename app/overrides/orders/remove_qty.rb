Deface::Override.new( :virtual_path => "spree/orders/_form",
                        :replace => %q{[data-hook='cart_items_headers']},
                        :name => "remove_qty",
                        :text => %q{<tr data-hook="cart_items_headers">
                                    <th class="cart-item-description-header" colspan="2"><%= t(:item) %></th>
                                    <th class="cart-item-price-header"><%= t(:price) %></th>
                                    <th class="cart-item-quantity-header"></th>
                                    <th class="cart-item-total-header"><%= t(:total) %></th>
                                    <th class="cart-item-delete-header"></th>
                                  </tr>})