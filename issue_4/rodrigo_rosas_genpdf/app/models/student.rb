class Student < ActiveRecord::Base
  has_many :items

  validates_presence_of :name, :address
  validates_associated :items

  accepts_nested_attributes_for :items, :allow_destroy => true,  :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } } 
end
