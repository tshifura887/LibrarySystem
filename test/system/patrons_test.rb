require "application_system_test_case"

class PatronsTest < ApplicationSystemTestCase
  setup do
    @patron = patrons(:one)
  end

  test "visiting the index" do
    visit patrons_url
    assert_selector "h1", text: "Patrons"
  end

  test "creating a Patron" do
    visit patrons_url
    click_on "New Patron"

    fill_in "First name", with: @patron.first_name
    fill_in "Last name", with: @patron.last_name
    click_on "Create Patron"

    assert_text "Patron was successfully created"
    click_on "Back"
  end

  test "updating a Patron" do
    visit patrons_url
    click_on "Edit", match: :first

    fill_in "First name", with: @patron.first_name
    fill_in "Last name", with: @patron.last_name
    click_on "Update Patron"

    assert_text "Patron was successfully updated"
    click_on "Back"
  end

  test "destroying a Patron" do
    visit patrons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Patron was successfully destroyed"
  end
end
