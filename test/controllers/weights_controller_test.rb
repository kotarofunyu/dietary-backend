require 'test_helper'

class WeightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weight = weights(:one)
  end

  test "should get index" do
    get weights_url, as: :json
    assert_response :success
  end

  test "should create weight" do
    assert_difference('Weight.count') do
      post weights_url, params: { weight: { date: @weight.date, weight: @weight.weight } }, as: :json
    end

    assert_response 201
  end

  test "should show weight" do
    get weight_url(@weight), as: :json
    assert_response :success
  end

  test "should update weight" do
    patch weight_url(@weight), params: { weight: { date: @weight.date, weight: @weight.weight } }, as: :json
    assert_response 200
  end

  test "should destroy weight" do
    assert_difference('Weight.count', -1) do
      delete weight_url(@weight), as: :json
    end

    assert_response 204
  end
end
