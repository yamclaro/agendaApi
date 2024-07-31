require 'faker'

Segmento.destroy_all
TipoEmpresa.destroy_all
Funcao.destroy_all
Empresa.destroy_all
Cliente.destroy_all
Prestador.destroy_all
Itinerario.destroy_all
Descanso.destroy_all
Servico.destroy_all
PrestadorServico.destroy_all
Agenda.destroy_all

# Cria segmentos
5.times do
  Segmento.create!(
    descricao: Faker::Company.industry,
    observacao: Faker::Lorem.sentence
  )
end

# Cria tipos de empresas
5.times do
  TipoEmpresa.create!(
    descricao: Faker::Company.type,
    observacao: Faker::Lorem.sentence
  )
end

# Certifica-se de que existam registros em Funcao
funcoes = Funcao.all
if funcoes.empty?
  5.times do
    Funcao.create!(
      descricao: Faker::Job.title,
      observacao: Faker::Lorem.sentence
    )
  end
  funcoes = Funcao.all # Atualiza a variável para refletir os novos registros
end

# Cria empresas
10.times do
  empresa = Empresa.create!(
    razao: Faker::Company.name,
    cnpj: Faker::Company.brazilian_company_number,
    dataFundacao: Faker::Date.between(from: '1990-01-01', to: '2020-12-31'),
    qtdFuncionarios: Faker::Number.between(from: 1, to: 50),
    qtdMaxFuncionarios: Faker::Number.between(from: 51, to: 200),
    site: Faker::Internet.url,
    sobre: Faker::Company.catch_phrase
  )

  # Cria clientes para cada empresa
  10.times do
    Cliente.create!(
      nome: Faker::Name.name,
      telefone: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email,
      empresa_id: empresa.id
    )
  end

  # Cria prestadores para cada empresa
  5.times do
    prestador = Prestador.create!(
      nome: Faker::Name.name,
      cpf: Faker::IdNumber.brazilian_citizen_number,
      email: Faker::Internet.email,
      ativo: [1, 0].sample,# Usa true ou false
      funcao_id: funcoes.sample.id
    )

    # Cria itinerários para cada prestador
    5.times do
      Itinerario.create!(
        data: Faker::Date.forward(days: 23),
        horaInicio: Faker::Time.forward(days: 23, period: :morning),
        horaFim: Faker::Time.forward(days: 23, period: :afternoon),
        prestador_id: prestador.id
      )
    end

    # Cria descansos para cada prestador
    3.times do
      Descanso.create!(
        data: Faker::Date.forward(days: 23),
        horaInicio: Faker::Time.forward(days: 23, period: :afternoon),
        horaFim: Faker::Time.forward(days: 23, period: :evening),
        prestador_id: prestador.id
      )
    end

    # Cria serviços para cada prestador
    5.times do
      servico = Servico.create!(
        descricao: Faker::Commerce.product_name,
        valor: Faker::Commerce.price(range: 50.0..500.0),
        tempo: Faker::Number.between(from: 30, to: 120)  # Ajustado para minutos
      )

      PrestadorServico.create!(
        prestador_id: prestador.id,
        servico_id: servico.id
      )
    end
  end
end

# Cria agendas
10.times do
  Agenda.create!(
    data: Faker::Date.forward(days: 23),
    hora: Faker::Time.forward(days: 23, period: :morning),
    observacao: Faker::Lorem.sentence,
    empresa_id: Empresa.all.sample.id,
    cliente_id: Cliente.all.sample.id,
    prestador_id: Prestador.all.sample.id,
    servico_id: Servico.all.sample.id
  )
end
