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
  
    @request = Requests.new params[:request]
    
    if @request.valid?
      @request.save
      redirect_to :action => "list"
    else
      render :action => "new"
    end
  
  end
  
end
