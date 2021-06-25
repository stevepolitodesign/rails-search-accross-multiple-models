require "test_helper"

class SearchEntryTest < ActiveSupport::TestCase
  setup do
    @search_entry = SearchEntry.new(searchable: posts(:one))
  end

  test "should be valid" do
    assert @search_entry.valid?
  end

  test "uniqueness scope" do
    @search_entry.save
    @duplicate_search_entry = SearchEntry.new(searchable: posts(:one))
    assert_not @duplicate_search_entry.valid?
  end
end
