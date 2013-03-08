class HouseholdAccountShop < ActiveRecord::Base
  attr_accessible :shop_id, :shop_text, :user_id

  validates_uniqueness_of :shop_id
  validates_presence_of :shop_id, :shop_id

  belongs_to :user  
end
