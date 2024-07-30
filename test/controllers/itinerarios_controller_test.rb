require "test_helper"

class ItinerariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itinerario = itinerarios(:one)
  end

  test "should get index" do
    get itinerarios_url, as: :json
    assert_response :success
  end

  test "should create itinerario" do
    assert_difference("Itinerario.count") do
      post itinerarios_url, params: { itinerario: { Prestador_id: @itinerario.Prestador_id, data: @itinerario.data, hora_inicio: @itinerario.hora_inicio } }, as: :json
    end

    assert_response :created
  end

  test "should show itinerario" do
    get itinerario_url(@itinerario), as: :json
    assert_response :success
  end

  test "should update itinerario" do
    patch itinerario_url(@itinerario), params: { itinerario: { Prestador_id: @itinerario.Prestador_id, data: @itinerario.data, hora_inicio: @itinerario.hora_inicio } }, as: :json
    assert_response :success
  end

  test "should destroy itinerario" do
    assert_difference("Itinerario.count", -1) do
      delete itinerario_url(@itinerario), as: :json
    end

    assert_response :no_content
  end
end
