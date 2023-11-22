require "application_system_test_case"

class BookingsControllersTest < ApplicationSystemTestCase
  setup do
    @bookings_controller = bookings_controllers(:one)
  end

  test "visiting the index" do
    visit bookings_controllers_url
    assert_selector "h1", text: "Bookings controllers"
  end

  test "should create bookings controller" do
    visit bookings_controllers_url
    click_on "New bookings controller"

    click_on "Create Bookings controller"

    assert_text "Bookings controller was successfully created"
    click_on "Back"
  end

  test "should update Bookings controller" do
    visit bookings_controller_url(@bookings_controller)
    click_on "Edit this bookings controller", match: :first

    click_on "Update Bookings controller"

    assert_text "Bookings controller was successfully updated"
    click_on "Back"
  end

  test "should destroy Bookings controller" do
    visit bookings_controller_url(@bookings_controller)
    click_on "Destroy this bookings controller", match: :first

    assert_text "Bookings controller was successfully destroyed"
  end
end
