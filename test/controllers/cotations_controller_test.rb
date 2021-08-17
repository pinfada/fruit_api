require "test_helper"

class CotationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cotation = cotations(:one)
  end

  test "should get index" do
    get cotations_url, as: :json
    assert_response :success
  end

  test "should create cotation" do
    assert_difference('Cotation.count') do
      post cotations_url, params: { cotation: { cotation_date: @cotation.cotation_date, price_id: @cotation.price_id, product_id: @cotation.product_id } }, as: :json
    end

    assert_response 201
  end

  test "should show cotation" do
    get cotation_url(@cotation), as: :json
    assert_response :success
  end

  test "should update cotation" do
    patch cotation_url(@cotation), params: { cotation: { cotation_date: @cotation.cotation_date, price_id: @cotation.price_id, product_id: @cotation.product_id } }, as: :json
    assert_response 200
  end

  test "should destroy cotation" do
    assert_difference('Cotation.count', -1) do
      delete cotation_url(@cotation), as: :json
    end

    assert_response 204
  end
end
