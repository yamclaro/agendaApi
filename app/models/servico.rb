class Servico < ApplicationRecord
    validates :descricao, :valor, :tempo, presence: true
end
