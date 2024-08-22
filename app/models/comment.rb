class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, presence: true, length: { minimum: 1, maximum: 500 }

  # Method to return the author's name
  def author_name
    user.name
  end
end
