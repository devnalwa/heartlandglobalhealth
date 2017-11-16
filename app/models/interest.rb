class Interest < ApplicationRecord
  has_and_belongs_to_many :user
  validates :name,   presence: true, length: { maximum: 255 }
  
  def self.all_interests()
    %w(Biology
      Hella
      Environmental\ Science
      Goofy\ Goober
      Lemons)
  end
  
end
