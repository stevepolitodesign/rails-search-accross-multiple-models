require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    @post = Post.new(title: "Title", body: "Body")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "should create search_entry on create" do
    assert_difference("SearchEntry.count", 1) do
      @post.save!
    end
    assert_equal @post.search_entry.title, @post.title
    assert_equal @post.search_entry.body, @post.body
  end

  test "should update search_entry on update" do
    updated_title = "Updated Title"
    updated_body  = "Updated Body"
    
    @post = posts(:one)

    assert_no_difference("SearchEntry.count") do
      @post.update(title: updated_title, body: updated_body)
    end

    assert_equal updated_title, @post.search_entry.title
    assert_equal updated_body, @post.search_entry.body
  end  

  test "should destroy search_entry on destroy" do
    @post = posts(:one)
    assert_difference("SearchEntry.count", -1) do
      @post.destroy
    end
  end
end
