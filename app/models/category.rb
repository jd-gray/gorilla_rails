class Category
  include Mongoid::Document
  has_many :posts 

  field :name, type: String

  validates_presence_of :name
end
