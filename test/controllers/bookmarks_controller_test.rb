require 'test_helper'

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookmark = bookmarks(:one)
  end

  test "should get index" do
    get bookmarks_url
    assert_response :success
  end

  test "should get new" do
    get new_bookmark_url
    assert_response :success
  end

  test "should create bookmark" do
    assert_difference('Bookmark.count') do
      post bookmarks_url, params: { bookmark: { category_id: @bookmark.category_id, name: @bookmark.name, url: @bookmark.url, variety_id: @bookmark.variety_id } }
    end

    assert_redirected_to bookmark_url(Bookmark.last)
  end

  test "should show bookmark" do
    get bookmark_url(@bookmark)
    assert_response :success
  end

  test "should get edit" do
    get edit_bookmark_url(@bookmark)
    assert_response :success
  end

  test "should update bookmark" do
    patch bookmark_url(@bookmark), params: { bookmark: { category_id: @bookmark.category_id, name: @bookmark.name, url: @bookmark.url, variety_id: @bookmark.variety_id } }
    assert_redirected_to bookmark_url(@bookmark)
  end

  test "should destroy bookmark" do
    assert_difference('Bookmark.count', -1) do
      delete bookmark_url(@bookmark)
    end

    assert_redirected_to bookmarks_url
  end
end
