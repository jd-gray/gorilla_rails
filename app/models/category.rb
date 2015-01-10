class Category
  include Mongoid::Document
  has_many :posts 

  field :name, type: String
end
