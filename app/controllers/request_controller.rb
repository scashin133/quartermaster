class RequestController < ApplicationController

  def index
    list
    render :action => "list"
  end
  
  def list
    
    @requests = Request.find(:all, :conditions => "purchase_id = 0", :order => "created_at ASC")
    
  end
  
  def new
  
    @new_request = Request.new
  
  end
  
  def create
  
    item_name = params[:new_request][:item]
    
    begin
      @item = Item.find_by_name(item_name)
    rescue
      @item = Item.new(:name => item_name)
      @item.save
    end
    
    params[:new_request].delete :item
  
    @new_request = Requests.new params[:new_request]
    
    if @new_request.valid?
      @new_request.item = @item
      @new_request.user = @current_user
      @new_request.save
      redirect_to :action => "list"
    else
      render :action => "new"
    end
  
  end
  
end
