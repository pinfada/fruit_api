require "test_helper"

class CharacteristicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @characteristic = characteristics(:one)
  end

  test "should get index" do
    get characteristics_url, as: :json
    assert_response :success
  end

  test "should create characteristic" do
    assert_difference('Characteristic.count') do
      post characteristics_url, params: { characteristic: { certification: @characteristic.certification, origine: @characteristic.origine, product_id: @characteristic.product_id, unit: @characteristic.unit } }, as: :json
    end

    assert_response 201
  end

  test "should show characteristic" do
    get characteristic_url(@characteristic), as: :json
    assert_response :success
  end

  test "should update characteristic" do
    patch characteristic_url(@characteristic), params: { characteristic: { certification: @characteristic.certification, origine: @characteristic.origine, product_id: @characteristic.product_id, unit: @characteristic.unit } }, as: :json
    assert_response 200
  end

  test "should destroy characteristic" do
    assert_difference('Characteristic.count', -1) do
      delete characteristic_url(@characteristic), as: :json
    end

    assert_response 204
  end
end
