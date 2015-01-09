class Comment
  include Mongoid::Document
  field :body, type: String

  embedded_in :post
  embeds_one :user

  accepts_nested_attributes_for :user

  def date_added
  	self.created_at.localtime.strftime("%-m/%-d/%Y | %l:%M %p")
  end
end
