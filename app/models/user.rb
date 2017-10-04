class User < ApplicationRecord
  before_save { email.downcase! }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,   presence: true, length: { maximum: 255 }
  validates :school, presence: true, length: { maximum: 255 }
  validates :email,  presence: true, length: { maximum: 255 },
                     format: { with: EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true

  def self.search(query)
    where("research LIKE ?", "%#{query}%")
  end
end
