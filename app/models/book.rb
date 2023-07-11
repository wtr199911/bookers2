class Book < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      image.attach(io: File.open(file_path), file_name: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
