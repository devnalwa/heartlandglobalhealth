class MemberEmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    #This is an array of emails that are allowed. YOu have to be from a memember school to sign up on this site
    allowed_emails = []
    allowed_emails << /^[A-Z0-9]+@grinnell\.edu\z/i
    allowed_emails << /^[A-Z0-9]+@central\.edu\z/i
    allowed_emails << /^[A-Z0-9]+@dmu\.edu\z/i
    allowed_emails << /^[A-Z0-9]+@drake\.edu\z/i
    allowed_emails << /^[A-Z0-9]+@iastate\.edu\z/i
    allowed_emails << /^[A-Z0-9]+@mercydesmoines\.org\z/i
    allowed_emails << /^[A-Z0-9]+@mchs\.org\z/i
    allowed_emails << /^[A-Z0-9]+@uiowa\.edu\z/i
    allowed_emails << /^[A-Z0-9]+@uni\.edu\z/i
    allowed_emails << /^[A-Z0-9]+@wmpenn\.edu\z/i
    valid_regexp = Regexp.union(allowed_emails)
    unless value =~ valid_regexp
      record.errors[attribute] << (options[:message] || "is not from a consortium member institution")
    end
  end
end

class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { email.downcase! }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,   presence: true, length: { maximum: 255 }
  validates :school, presence: true, length: { maximum: 255 }
  validates :email,  presence: true, length: { maximum: 255 },
                     format: { with: EMAIL_REGEX }, 
                     member_email: true,
                     uniqueness: { case_sensitive: false }
  validates :password, presence: true

  def self.search(query)
    where("name LIKE ? OR school LIKE ?", "%#{query}%", "%#{query}%")
  end
end
