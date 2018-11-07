class Listing < ApplicationRecord
    belongs_to :user
    validates :title, presence: true,
                      length: { minimum: 5}
    validates :description, length: { maximum: 4000 }
    mount_uploaders :images, ImageUploader

    scope :max_guest_scope, -> (max_guest_number) { where("max_guest_number >= ? ", max_guest_number) }
    scope :city_scope, -> (city) { where city: city }
    scope :price_range_scope, -> (min_price, max_price) { where("price >= ? AND price <= ?", min_price, max_price) }


end
