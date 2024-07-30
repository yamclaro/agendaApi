require "test_helper"

class SegmentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @segmento = segmentos(:one)
  end

  test "should get index" do
    get segmentos_url, as: :json
    assert_response :success
  end

  test "should create segmento" do
    assert_difference("Segmento.count") do
      post segmentos_url, params: { segmento: { descricao: @segmento.descricao } }, as: :json
    end

    assert_response :created
  end

  test "should show segmento" do
    get segmento_url(@segmento), as: :json
    assert_response :success
  end

  test "should update segmento" do
    patch segmento_url(@segmento), params: { segmento: { descricao: @segmento.descricao } }, as: :json
    assert_response :success
  end

  test "should destroy segmento" do
    assert_difference("Segmento.count", -1) do
      delete segmento_url(@segmento), as: :json
    end

    assert_response :no_content
  end
end
