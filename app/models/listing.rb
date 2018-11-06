class Listing < ApplicationRecord
    validates :title, presence: true,
                      length: { minimum: 5}
    belongs_to :user
    validates :description, length: { maximum: 4000 }

    mount_uploaders :images, ImageUploader



end
