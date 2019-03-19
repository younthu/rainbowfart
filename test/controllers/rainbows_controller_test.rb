require 'test_helper'

class RainbowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rainbow = rainbows(:one)
  end

  test "should get index" do
    get rainbows_url
    assert_response :success
  end

  test "should get new" do
    get new_rainbow_url
    assert_response :success
  end

  test "should create rainbow" do
    assert_difference('Rainbow.count') do
      post rainbows_url, params: { rainbow: { sentence: @rainbow.sentence } }
    end

    assert_redirected_to rainbow_url(Rainbow.last)
  end

  test "should show rainbow" do
    get rainbow_url(@rainbow)
    assert_response :success
  end

  test "should get edit" do
    get edit_rainbow_url(@rainbow)
    assert_response :success
  end

  test "should update rainbow" do
    patch rainbow_url(@rainbow), params: { rainbow: { sentence: @rainbow.sentence } }
    assert_redirected_to rainbow_url(@rainbow)
  end

  test "should destroy rainbow" do
    assert_difference('Rainbow.count', -1) do
      delete rainbow_url(@rainbow)
    end

    assert_redirected_to rainbows_url
  end
end
