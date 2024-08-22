class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :body, presence: true
  validates :tags, presence: true

  # Method to handle tags as an array
  def tag_list
    tags.split(",").map(&:strip)
  end

  # Method to return the author's name
  def author_name
    user.name
  end
end
