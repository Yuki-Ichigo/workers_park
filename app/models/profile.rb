class Profile < ApplicationRecord
  belongs_to :user

  validates :introduction, length: {maximum: 250}
  validates :future, length: {maximum: 250}

  enum employment_type: {both: 0, contract: 1, engaging: 2}
end
