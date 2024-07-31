require "test_helper"

class DescansosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @descanso = descansos(:one)
  end

  test "should get index" do
    get descansos_url, as: :json
    assert_response :success
  end

  test "should create descanso" do
    assert_difference("Descanso.count") do
      post descansos_url, params: { descanso: { data: @descanso.data, horaFim: @descanso.horaFim, horaInicio: @descanso.horaInicio, prestador_id: @descanso.prestador_id } }, as: :json
    end

    assert_response :created
  end

  test "should show descanso" do
    get descanso_url(@descanso), as: :json
    assert_response :success
  end

  test "should update descanso" do
    patch descanso_url(@descanso), params: { descanso: { data: @descanso.data, horaFim: @descanso.horaFim, horaInicio: @descanso.horaInicio, prestador_id: @descanso.prestador_id } }, as: :json
    assert_response :success
  end

  test "should destroy descanso" do
    assert_difference("Descanso.count", -1) do
      delete descanso_url(@descanso), as: :json
    end

    assert_response :no_content
  end
end
