class Listing < ApplicationRecord
    validates :title, presence: true,
                      length: { minimum: 5}
    belongs_to :user
    validates :property_description, length: { maximum: 400 }

    def property_types
        
    end

end
