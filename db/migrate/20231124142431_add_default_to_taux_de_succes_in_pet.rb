class AddDefaultToTauxDeSuccesInPet < ActiveRecord::Migration[7.1]
  def change
    change_column :pets, :taux_de_succes, :float, default: 0
  end
end
