class Item < ActiveRecord::Base

  has_many :requests
  has_many :purchases
  
  

end
