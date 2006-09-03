class ItemController < ApplicationController

  layout false

  def auto_complete_for_item_name
    @items = Item.find(:all,
      :conditions => [ 'LOWER(name) LIKE ?',
      params[:new_request][:item].downcase + '%' ])
    render :inline => "<%= auto_complete_result(@items, 'name') %>"
  end
end
