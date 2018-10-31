class CreateListings < ActiveRecord::Migration[5.2]
  def change
  create_table :listings do |t|
    
    t.string :title
    t.text :description
    t.integer :price
    t.string :property_type #here i want to have either Entire place, private room or shared room
    t.integer :max_guest_number
    t.string :country
    t.string :city
    t.belongs_to :user, index: true
    
    t.timestamps
  end
end
end