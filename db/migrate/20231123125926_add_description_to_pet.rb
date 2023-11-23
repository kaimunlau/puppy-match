class AddDescriptionToPet < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :description, :string
  end
end
