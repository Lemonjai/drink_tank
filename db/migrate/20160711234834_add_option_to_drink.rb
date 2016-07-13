class AddOptionToDrink < ActiveRecord::Migration
  def change
    add_column :drinks, :option, :string
  end
end
