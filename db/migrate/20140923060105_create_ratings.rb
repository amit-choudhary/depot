class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating_number
      t.references :product
      t.references :user

      t.timestamps
    end
  end
end
