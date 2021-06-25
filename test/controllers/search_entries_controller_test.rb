require "test_helper"

class SearchEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_entry = search_entries(:one)
  end

  test "should get index" do
    get search_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_search_entry_url
    assert_response :success
  end

  test "should create search_entry" do
    assert_difference('SearchEntry.count') do
      post search_entries_url, params: { search_entry: { body: @search_entry.body, searchable_id: @search_entry.searchable_id, searchable_type: @search_entry.searchable_type, title: @search_entry.title } }
    end

    assert_redirected_to search_entry_url(SearchEntry.last)
  end

  test "should show search_entry" do
    get search_entry_url(@search_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_entry_url(@search_entry)
    assert_response :success
  end

  test "should update search_entry" do
    patch search_entry_url(@search_entry), params: { search_entry: { body: @search_entry.body, searchable_id: @search_entry.searchable_id, searchable_type: @search_entry.searchable_type, title: @search_entry.title } }
    assert_redirected_to search_entry_url(@search_entry)
  end

  test "should destroy search_entry" do
    assert_difference('SearchEntry.count', -1) do
      delete search_entry_url(@search_entry)
    end

    assert_redirected_to search_entries_url
  end
end
