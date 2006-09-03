class Purchase < ActiveRecord::Base

  belongs_to :item
  belongs_to :request
  

end
