class User < ApplicationRecord
   

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :books
  has_many :post_images, dependent: :destroy
  has_one_attached :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :name, length:{ minimum: 2,maximum: 20 },uniqueness: true
         validates :introduction, length:{ maximum: 50 }
  
         def get_profile_image(width, height)
          unless profile_image.attached?
            file_path = Rails.root.join('app/assets/images/default-image.jpg')
            profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
          end
          profile_image.variant(resize_to_limit: [width, height]).processed
        end
end
