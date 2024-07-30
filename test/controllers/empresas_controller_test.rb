require "test_helper"

class EmpresasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empresa = empresas(:one)
  end

  test "should get index" do
    get empresas_url, as: :json
    assert_response :success
  end

  test "should create empresa" do
    assert_difference("Empresa.count") do
      post empresas_url, params: { empresa: { Segmento_id: @empresa.Segmento_id, TipoEmpresa_id: @empresa.TipoEmpresa_id, cnpj: @empresa.cnpj, dataFundacao: @empresa.dataFundacao, email: @empresa.email, observacao: @empresa.observacao, razao: @empresa.razao, site: @empresa.site, status: @empresa.status, telefone: @empresa.telefone } }, as: :json
    end

    assert_response :created
  end

  test "should show empresa" do
    get empresa_url(@empresa), as: :json
    assert_response :success
  end

  test "should update empresa" do
    patch empresa_url(@empresa), params: { empresa: { Segmento_id: @empresa.Segmento_id, TipoEmpresa_id: @empresa.TipoEmpresa_id, cnpj: @empresa.cnpj, dataFundacao: @empresa.dataFundacao, email: @empresa.email, observacao: @empresa.observacao, razao: @empresa.razao, site: @empresa.site, status: @empresa.status, telefone: @empresa.telefone } }, as: :json
    assert_response :success
  end

  test "should destroy empresa" do
    assert_difference("Empresa.count", -1) do
      delete empresa_url(@empresa), as: :json
    end

    assert_response :no_content
  end
end
