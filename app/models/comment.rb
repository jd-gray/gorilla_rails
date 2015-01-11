class Comment
  include Mongoid::Document
  field :body, type: String

  belongs_to :post
  belongs_to :user

  def date_added
  	self.created_at.localtime.strftime("%-m/%-d/%Y | %l:%M %p")
  end

  validates :body, presence: true
end
