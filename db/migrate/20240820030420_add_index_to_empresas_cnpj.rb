# db/migrate/xxxxxx_add_index_to_empresas_cnpj.rb

class AddIndexToEmpresasCnpj < ActiveRecord::Migration[6.0]
  def change
    add_index :empresas, :cnpj, unique: true
  end
end
