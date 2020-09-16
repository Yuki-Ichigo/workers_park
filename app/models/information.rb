class Information < ApplicationRecord
  belongs_to :company

  validates :introduction, length: {maximum: 1000}
  validates :future, length: {maximum: 1000}

  attachment :i_image1, destroy: false
  attachment :i_image2, destroy: false
  attachment :f_image1, destroy: false
  attachment :f_image2, destroy: false
end
