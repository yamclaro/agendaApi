class PrestadorServico < ApplicationRecord
  belongs_to :prestador
  belongs_to :servico
end
