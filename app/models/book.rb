class Book < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
