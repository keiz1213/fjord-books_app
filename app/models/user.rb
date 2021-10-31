# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :image
  validate :image_type

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def image_type
    errors.add(:image, 'はpng、jpegまたはgifでアップロードしてください') unless image.blob.content_type.in?(%('image/png image/jpeg image/gif'))
  end
end
