require "application_system_test_case"

class AttendeesTest < ApplicationSystemTestCase
  setup do
    @attendee = attendees(:one)
  end

  test "visiting the index" do
    visit attendees_url
    assert_selector "h1", text: "Attendees"
  end

  test "creating a Attendee" do
    visit attendees_url
    click_on "New Attendee"

    fill_in "Event", with: @attendee.event_id
    fill_in "Guests Count", with: @attendee.guests_count
    fill_in "User", with: @attendee.user_id
    click_on "Create Attendee"

    assert_text "Attendee was successfully created"
    click_on "Back"
  end

  test "updating a Attendee" do
    visit attendees_url
    click_on "Edit", match: :first

    fill_in "Event", with: @attendee.event_id
    fill_in "Guests Count", with: @attendee.guests_count
    fill_in "User", with: @attendee.user_id
    click_on "Update Attendee"

    assert_text "Attendee was successfully updated"
    click_on "Back"
  end

  test "destroying a Attendee" do
    visit attendees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attendee was successfully destroyed"
  end
end
