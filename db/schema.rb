# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_07_31_165223) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendas", force: :cascade do |t|
    t.date "data"
    t.time "hora"
    t.string "observacao"
    t.bigint "empresa_id", null: false
    t.bigint "cliente_id", null: false
    t.bigint "prestador_id", null: false
    t.bigint "servico_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_agendas_on_cliente_id"
    t.index ["empresa_id"], name: "index_agendas_on_empresa_id"
    t.index ["prestador_id"], name: "index_agendas_on_prestador_id"
    t.index ["servico_id"], name: "index_agendas_on_servico_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.bigint "empresa_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_clientes_on_empresa_id"
  end

  create_table "descansos", force: :cascade do |t|
    t.date "data"
    t.time "horaInicio"
    t.time "horaFim"
    t.bigint "prestador_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prestador_id"], name: "index_descansos_on_prestador_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.string "razao"
    t.string "cnpj"
    t.date "dataFundacao"
    t.integer "qtdFuncionarios"
    t.integer "qtdMaxFuncionarios"
    t.string "site"
    t.text "sobre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "logradouro"
    t.string "numero"
    t.string "bairro"
    t.string "cidade"
    t.string "uf"
    t.string "cep"
    t.string "complemento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "empresa_id", null: false
    t.index ["empresa_id"], name: "index_enderecos_on_empresa_id"
  end

  create_table "funcaos", force: :cascade do |t|
    t.string "descricao"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itinerarios", force: :cascade do |t|
    t.date "data"
    t.time "horaInicio"
    t.time "horaFim"
    t.bigint "prestador_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prestador_id"], name: "index_itinerarios_on_prestador_id"
  end

  create_table "prestador_servicos", force: :cascade do |t|
    t.bigint "prestador_id", null: false
    t.bigint "servico_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prestador_id"], name: "index_prestador_servicos_on_prestador_id"
    t.index ["servico_id"], name: "index_prestador_servicos_on_servico_id"
  end

  create_table "prestadors", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "email"
    t.bit "ativo", limit: 1
    t.bigint "funcao_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcao_id"], name: "index_prestadors_on_funcao_id"
  end

  create_table "segmentos", force: :cascade do |t|
    t.string "descricao"
    t.string "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servicos", force: :cascade do |t|
    t.string "descricao"
    t.float "valor"
    t.time "tempo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_empresas", force: :cascade do |t|
    t.string "descricao"
    t.string "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "agendas", "clientes"
  add_foreign_key "agendas", "empresas"
  add_foreign_key "agendas", "prestadors"
  add_foreign_key "agendas", "servicos"
  add_foreign_key "clientes", "empresas"
  add_foreign_key "descansos", "prestadors"
  add_foreign_key "enderecos", "empresas"
  add_foreign_key "itinerarios", "prestadors"
  add_foreign_key "prestador_servicos", "prestadors"
  add_foreign_key "prestador_servicos", "servicos"
  add_foreign_key "prestadors", "funcaos"
end
