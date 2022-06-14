require "test_helper"

class HousingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @housing = housings(:one)
  end

  test "should get index" do
    get housings_url, as: :json
    assert_response :success
  end

  test "should create housing" do
    assert_difference("Housing.count") do
      post housings_url, params: { housing: { address: @housing.address, description: @housing.description, price: @housing.price, title: @housing.title } }, as: :json
    end

    assert_response :created
  end

  test "should show housing" do
    get housing_url(@housing), as: :json
    assert_response :success
  end

  test "should update housing" do
    patch housing_url(@housing), params: { housing: { address: @housing.address, description: @housing.description, price: @housing.price, title: @housing.title } }, as: :json
    assert_response :success
  end

  test "should destroy housing" do
    assert_difference("Housing.count", -1) do
      delete housing_url(@housing), as: :json
    end

    assert_response :no_content
  end
end
