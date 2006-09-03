class RequestController < ApplicationController

  def index
    list
    render :action => "list"
  end
  
  def list
    
    @requests = Request.find(:all, :conditions => "purchase_id = 0", :order => "created_at ASC")
    
  end
  
  def new
  
    @request = Request.new
  
  end
  
  def create
  
    item_name = params[:request][:item]
    
    begin
      @item = Item.find_by_name(item_name)
    rescue
      @item = Item.new(:name => item_name)
      @item.save
    end
    
    params[:request].delete :item
  
    @request = Requests.new params[:request]
    
    if @request.valid?
      @request.item = @item
      @request.user = @current_user
      @request.save
      redirect_to :action => "list"
    else
      render :action => "new"
    end
  
  end
  
end
