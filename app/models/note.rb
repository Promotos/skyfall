class Note < ActiveRecord::Base
  attr_accessible :note_id, :note_text
  
  validates_presence_of :note_id
  validates_uniqueness_of :note_id

end
