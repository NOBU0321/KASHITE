require 'test_helper'

class LandControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get land_index_url
    assert_response :success
  end

  test "should get new" do
    get land_new_url
    assert_response :success
  end

  test "should get create" do
    get land_create_url
    assert_response :success
  end

  test "should get listing" do
    get land_listing_url
    assert_response :success
  end

  test "should get pricing" do
    get land_pricing_url
    assert_response :success
  end

  test "should get description" do
    get land_description_url
    assert_response :success
  end

  test "should get photo_upload" do
    get land_photo_upload_url
    assert_response :success
  end

  test "should get amenities" do
    get land_amenities_url
    assert_response :success
  end

  test "should get location" do
    get land_location_url
    assert_response :success
  end

  test "should get update" do
    get land_update_url
    assert_response :success
  end

end
