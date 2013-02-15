class Note < ActiveRecord::Base
  attr_accessible :note_id, :note_text, :user_id
  
  validates_presence_of :note_id, :user_id
  validates_uniqueness_of :note_id

  belongs_to :user
end
