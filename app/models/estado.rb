class Estado < ActiveRecord::Base
  attr_accessible :descripcion, :nombre, :nombre_corto
  validates_presence_of :nombre
  
  has_many :candidates
  accepts_nested_attributes_for :candidates
  
end