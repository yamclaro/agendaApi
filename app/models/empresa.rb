class Empresa < ApplicationRecord
  belongs_to :Segmento
  belongs_to :TipoEmpresa
end
