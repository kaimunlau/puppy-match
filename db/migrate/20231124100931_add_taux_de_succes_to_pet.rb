class AddTauxDeSuccesToPet < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :taux_de_succes, :float
  end
end
