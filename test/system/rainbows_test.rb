require "application_system_test_case"

class RainbowsTest < ApplicationSystemTestCase
  setup do
    @rainbow = rainbows(:one)
  end

  test "visiting the index" do
    visit rainbows_url
    assert_selector "h1", text: "Rainbows"
  end

  test "creating a Rainbow" do
    visit rainbows_url
    click_on "New Rainbow"

    fill_in "Sentence", with: @rainbow.sentence
    click_on "Create Rainbow"

    assert_text "Rainbow was successfully created"
    click_on "Back"
  end

  test "updating a Rainbow" do
    visit rainbows_url
    click_on "Edit", match: :first

    fill_in "Sentence", with: @rainbow.sentence
    click_on "Update Rainbow"

    assert_text "Rainbow was successfully updated"
    click_on "Back"
  end

  test "destroying a Rainbow" do
    visit rainbows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rainbow was successfully destroyed"
  end
end
