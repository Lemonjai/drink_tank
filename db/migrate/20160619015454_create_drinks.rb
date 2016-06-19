class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :country
      t.integer :price_in_cents

      t.timestamps null: false
    end
  end
end
