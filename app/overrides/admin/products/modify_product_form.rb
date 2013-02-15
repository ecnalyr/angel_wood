Deface::Override.new( :virtual_path => "spree/admin/products/_form",
                        :replace => "[data-hook='admin_product_form_fields']",
                        :name => "modify_product_form",
                        :text => %q{<div data-hook="admin_product_form_fields">
  
  <div class="left eight columns alpha" data-hook="admin_product_form_left">    
    <%= f.field_container :name do %>
      <%= f.label :name, raw(t(:name) + content_tag(:span, ' *', :class => 'required')) %>
      <%= f.text_field :name, :class => 'fullwidth title' %>
      <%= f.error_message_on :name %>
    <% end %>

    <%= f.field_container :permalink do %>
      <%= f.label :permalink, raw(t(:permalink) + content_tag(:span, ' *',  :class => "required")) %>
      <%= f.text_field :permalink, :class => 'fullwidth title' %>
      <%= f.error_message_on :permalink %>
    <% end %>

    <%= f.field_container :description do %>
      <%= f.label :description, t(:description) %>
      <%= f.text_area :description, {:rows => "#{unless @product.has_variants? then '20' else '13' end}", :class => 'fullwidth'} %>
      <%= f.error_message_on :description %>
    <% end %>
  </div>

  <div class="right four columns omega" data-hook="admin_product_form_right">
    <%= f.field_container :price do %>
      <%= f.label :price, raw(t(:master_price) + content_tag(:span, ' *', :class => "required")) %>
      <%= f.text_field :price, :value => number_to_currency(@product.price, :unit => '') %>
      <%= f.error_message_on :price %>
    <% end %>

    <div class="alpha two columns">
      <%= f.field_container :cost_price do %>
        <%= f.label :cost_price, t(:cost_price) %>
        <%= f.text_field :cost_price, :value => number_to_currency(@product.cost_price, :unit => '') %>
        <%= f.error_message_on :cost_price %>
      <% end %>
    </div>
    <div class="omega two columns">
      <%= f.field_container :cost_currency do %>
        <%= f.label :cost_currency, t(:cost_currency) %>
        <%= f.text_field :cost_currency %>
        <%= f.error_message_on :cost_currency %>
      <% end %>
    </div>

    <div class="clear"></div>

    <%= f.field_container :available_on do %>
      <%= f.label :available_on, t(:available_on) %>
      <%= f.error_message_on :available_on %>
      <%= f.text_field :available_on, :value => datepicker_field_value(@product.available_on), :class => 'datepicker' %>
    <% end %>

    <% unless @product.has_variants? %>
      <%= f.field_container :sku do %>
        <%= f.label :sku, t(:sku) %>
        <%= f.text_field :sku, :size => 16 %>
      <% end %>

      <% if Spree::Config[:track_inventory_levels] %>        
        <div class="alpha two columns">
          <%= f.field_container :on_hand do %>
            <%= f.label :on_hand, t(:on_hand) %>
            <%= f.number_field :on_hand, :min => 0 %>
          <% end %>
        </div>
        <div class="omega two columns">
          <%= f.field_container :on_demand, :class => ['checkbox'] do %>
            <label>
              <%= f.check_box :on_demand %>
              <%= t(:on_demand) %>
            </label>
          <% end %>
          <%= f.field_container :worthy_of_welcome_page, :class => ['checkbox'] do %>
            <label>
              <%= f.check_box :worthy_of_welcome_page %>
              <%= t(:worthy_of_welcome_page) %>
            </label>
          <% end %>
        </div>

        <div class="clear"></div>
      <% end %>

      <ul id="shipping_specs">
        <li id="shipping_specs_weight_field" class="field alpha two columns">
          <%= f.label :weight, t(:weight) %>
          <%= f.text_field :weight, :size => 4 %>
        </li>
        <li id="shipping_specs_height_field" class="field omega two columns">
          <%= f.label :height, t(:height) %>
          <%= f.text_field :height, :size => 4 %>
        </li>
        <li id="shipping_specs_width_field" class="field alpha two columns">
          <%= f.label :width, t(:width) %>
          <%= f.text_field :width, :size => 4 %>
        </li>
        <li id="shipping_specs_depth_field" class="field omega two columns">
          <%= f.label :depth, t(:depth) %>
          <%= f.text_field :depth, :size => 4 %>
        </li>
      </ul>
    <% end %>

    <%= f.field_container :shipping_categories do %>
      <%= f.label :shipping_category_id, t(:shipping_categories) %>
      <%= f.collection_select(:shipping_category_id, @shipping_categories, :id, :name, { :include_blank => 'None' }, { :class => 'select2' }) %>
      <%= f.error_message_on :shipping_category %>
    <% end %>

    <%= f.field_container :tax_category do %>
      <%= f.label :tax_category_id, t(:tax_category) %>
      <%= f.collection_select(:tax_category_id, @tax_categories, :id, :name, { :include_blank => 'None' }, { :class => 'select2' }) %>
      <%= f.error_message_on :tax_category %>
    <% end %>
  </div>

  <div class="twelve columns alpha omega">
    <%= f.field_container :taxons do %>
      <%= f.label :taxon_ids, t(:taxons) %><br />
      <%= f.hidden_field :taxon_ids, :value => @product.taxon_ids.join(',') %>
    <% end %>

    <%= f.field_container :option_types do %>
      <%= f.label :option_type_ids, t(:option_types) %>
      <%= f.select :option_type_ids, option_types_options_for(@product), {}, :class => "select2", :multiple => true %>
    <% end %>
  </div>

  <!-- <h2><%= t(:metadata) %></h2> -->
  <div data-hook="admin_product_form_meta" class="alpha omega twelve columns">
    <%= f.field_container :meta_keywords do %>
      <%= f.label :meta_keywords, t(:meta_keywords) %>
      <%= f.text_field :meta_keywords, :class => 'fullwidth' %>
    <% end %>

    <%= f.field_container :meta_description do %>
      <%= f.label :meta_description, t(:meta_description) %>
      <%= f.text_field :meta_description, :class => 'fullwidth' %>
    <% end %>
  </div>

  <div class="clear"></div>

  <div data-hook="admin_product_form_additional_fields"></div>

  <div class="clear"></div>
</div>})