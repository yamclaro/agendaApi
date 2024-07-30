class ChangePrimaryKeyOnPrestadores < ActiveRecord::Migration[7.2]
  def change
    remove_column :prestadores, :id

    # Add a composite primary key
    add_index :prestadores, [:empresa_id, :cpf], unique: true
  end
end
