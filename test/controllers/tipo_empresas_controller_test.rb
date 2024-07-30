require "test_helper"

class TipoEmpresasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_empresa = tipo_empresas(:one)
  end

  test "should get index" do
    get tipo_empresas_url, as: :json
    assert_response :success
  end

  test "should create tipo_empresa" do
    assert_difference("TipoEmpresa.count") do
      post tipo_empresas_url, params: { tipo_empresa: { descricao: @tipo_empresa.descricao } }, as: :json
    end

    assert_response :created
  end

  test "should show tipo_empresa" do
    get tipo_empresa_url(@tipo_empresa), as: :json
    assert_response :success
  end

  test "should update tipo_empresa" do
    patch tipo_empresa_url(@tipo_empresa), params: { tipo_empresa: { descricao: @tipo_empresa.descricao } }, as: :json
    assert_response :success
  end

  test "should destroy tipo_empresa" do
    assert_difference("TipoEmpresa.count", -1) do
      delete tipo_empresa_url(@tipo_empresa), as: :json
    end

    assert_response :no_content
  end
end
