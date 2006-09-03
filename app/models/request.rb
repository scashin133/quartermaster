class Request < ActiveRecord::Base

  has_one :purchase
  belongs_to :item

end
