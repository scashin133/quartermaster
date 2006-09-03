class Purchase < ActiveRecord::Base

  belongs_to :item
  has_one :request
  

end
