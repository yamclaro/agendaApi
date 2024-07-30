class Empresa < ApplicationRecord
  belongs_to :Segmento
  belongs_to :TipoEmpresa
  has_many :prestadores
end
