class ItemController < ApplicationController

  def auto_complete_for_item_name
    @items = Item.find(:all,
      :conditions => [ 'LOWER(name) LIKE ?',
      '%' + request.raw_post.downcase + '%' ])
  end
end
