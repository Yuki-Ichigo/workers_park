class Profile < ApplicationRecord
  belongs_to :user

  validates :introduction, length: {maximum: 250}
  validates :future, length: {maximum: 250}

  enum employment_type: {社員: 0, 副業委託: 1, 問わない: 2}
end
