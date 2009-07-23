class Item < ActiveRecord::Base
  belongs_to :student

  validates_presence_of :name
  validates_numericality_of :value
end
