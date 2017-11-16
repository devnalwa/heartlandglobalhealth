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
  
  has_many :interests
  
  def self.search(query)
    puts query
    where("name LIKE ? OR school LIKE ?", "%#{query}%", "%#{query}%")
  end
  
end