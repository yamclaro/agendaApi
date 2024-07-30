require "test_helper"

class PrestadorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prestador = prestadors(:one)
  end

  test "should get index" do
    get prestadors_url, as: :json
    assert_response :success
  end

  test "should create prestador" do
    assert_difference("Prestador.count") do
      post prestadors_url, params: { prestador: { cpf: @prestador.cpf, data_engresso: @prestador.data_engresso, data_saida: @prestador.data_saida, email: @prestador.email, nome: @prestador.nome, observacoes: @prestador.observacoes, status: @prestador.status, telefone: @prestador.telefone } }, as: :json
    end

    assert_response :created
  end

  test "should show prestador" do
    get prestador_url(@prestador), as: :json
    assert_response :success
  end

  test "should update prestador" do
    patch prestador_url(@prestador), params: { prestador: { cpf: @prestador.cpf, data_engresso: @prestador.data_engresso, data_saida: @prestador.data_saida, email: @prestador.email, nome: @prestador.nome, observacoes: @prestador.observacoes, status: @prestador.status, telefone: @prestador.telefone } }, as: :json
    assert_response :success
  end

  test "should destroy prestador" do
    assert_difference("Prestador.count", -1) do
      delete prestador_url(@prestador), as: :json
    end

    assert_response :no_content
  end
end
