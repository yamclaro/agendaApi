class AddForeingKeyEmpresaToEndereco < ActiveRecord::Migration[7.2]
  def change
    add_reference :enderecos, :empresa, null: false, foreign_key: true
  end
end
