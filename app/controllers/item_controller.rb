class ItemController < ApplicationController

  def auto_complete_for_item_name
    @items = Item.find(:all,
      :conditions => [ 'LOWER(name) LIKE ?',
      '%' + request.raw_post.downcase + '%' ])
    render :inline => '<%= auto_complete_result(@items, "name") %>'
  end
end
