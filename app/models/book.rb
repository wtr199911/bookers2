class Book < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default.jpg')
      image.attach(io: File.open(file_path), file_name: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
