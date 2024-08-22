class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :image, allow_blank: true, format: { with: URI.regexp(%w[http https]), message: "must be a valid URL" }

  # Method to return a default image if none is provided
  def display_image
    image.presence || "https://via.placeholder.com/150"
  end
end
