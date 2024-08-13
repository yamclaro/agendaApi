class TipoEmpresa < ApplicationRecord
    validates :descricao, presence: true
end
