class MemberEmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    allowed_emails = []
    allowed_emails << /A[^@\s]+@grinnell\.edu\z/i
    allowed_emails << /A[^@\s]+@central\.edu\z/i
    allowed_emails << /A[^@\s]+@dmu\.edu\z/i
    allowed_emails << /A[^@\s]+@drake\.edu\z/i
    allowed_emails << /A[^@\s]+@iastate\.edu\z/i
    allowed_emails << /A[^@\s]+@uiowa\.edu\z/i
    allowed_emails << /A[^@\s]+@uni\.edu\z/i
    allowed_emails << /A[^@\s]+@wmpenn\.edu\z/i
    valid_regexp = Regexp.union(allowed_emails)
    unless value =~ valid_regexp
      record.errors[attribute] << (options[:message] || "is not from a consortium member institution")
    end
  end
end

class User < ApplicationRecord
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
    where("research LIKE ?", "%#{query}%")
  end
end
