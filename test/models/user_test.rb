require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(name: "Name", biography: "Biography")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should create search_entry on create" do
    assert_difference("SearchEntry.count", 1) do
      @user.save!
    end
    assert_equal @user.search_entry.title, @user.name
    assert_equal @user.search_entry.body, @user.biography
  end

  test "should update search_entry on update" do
    updated_name        = "Updated Title"
    updated_biography   = "Updated Biography"
    
    @user = users(:one)

    assert_no_difference("SearchEntry.count") do
      @user.update(name: updated_name, biography: updated_biography)
    end

    assert_equal updated_name, @user.search_entry.title
    assert_equal updated_biography, @user.search_entry.body
  end  

  test "should destroy search_entry on destroy" do
    @user = users(:one)
    assert_difference("SearchEntry.count", -1) do
      @user.destroy
    end
  end
end
