require "test_helper"

class AgendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agenda = agendas(:one)
  end

  test "should get index" do
    get agendas_url, as: :json
    assert_response :success
  end

  test "should create agenda" do
    assert_difference("Agenda.count") do
      post agendas_url, params: { agenda: { cliente_id: @agenda.cliente_id, data: @agenda.data, empresa_id: @agenda.empresa_id, hora: @agenda.hora, observacao: @agenda.observacao, prestador_id: @agenda.prestador_id, servico_id: @agenda.servico_id } }, as: :json
    end

    assert_response :created
  end

  test "should show agenda" do
    get agenda_url(@agenda), as: :json
    assert_response :success
  end

  test "should update agenda" do
    patch agenda_url(@agenda), params: { agenda: { cliente_id: @agenda.cliente_id, data: @agenda.data, empresa_id: @agenda.empresa_id, hora: @agenda.hora, observacao: @agenda.observacao, prestador_id: @agenda.prestador_id, servico_id: @agenda.servico_id } }, as: :json
    assert_response :success
  end

  test "should destroy agenda" do
    assert_difference("Agenda.count", -1) do
      delete agenda_url(@agenda), as: :json
    end

    assert_response :no_content
  end
end
