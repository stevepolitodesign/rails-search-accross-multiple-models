require "application_system_test_case"

class SearchEntriesTest < ApplicationSystemTestCase
  setup do
    @search_entry = search_entries(:one)
  end

  test "visiting the index" do
    visit search_entries_url
    assert_selector "h1", text: "Search Entries"
  end

  test "creating a Search entry" do
    visit search_entries_url
    click_on "New Search Entry"

    fill_in "Body", with: @search_entry.body
    fill_in "Searchable", with: @search_entry.searchable_id
    fill_in "Searchable type", with: @search_entry.searchable_type
    fill_in "Title", with: @search_entry.title
    click_on "Create Search entry"

    assert_text "Search entry was successfully created"
    click_on "Back"
  end

  test "updating a Search entry" do
    visit search_entries_url
    click_on "Edit", match: :first

    fill_in "Body", with: @search_entry.body
    fill_in "Searchable", with: @search_entry.searchable_id
    fill_in "Searchable type", with: @search_entry.searchable_type
    fill_in "Title", with: @search_entry.title
    click_on "Update Search entry"

    assert_text "Search entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Search entry" do
    visit search_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Search entry was successfully destroyed"
  end
end
