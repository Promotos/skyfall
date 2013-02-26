class HouseholdAccountCategory < ActiveRecord::Base
  attr_accessible :category_id, :category_text, :user_id

  validates_uniqueness_of :category_id
  validates_presence_of :category_id, :user_id

  belongs_to :user
end
