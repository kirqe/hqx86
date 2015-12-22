require 'test_helper'

class ShowcasesControllerTest < ActionController::TestCase
  setup do
    @showcase = showcases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:showcases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create showcase" do
    assert_difference('Showcase.count') do
      post :create, showcase: { album_url: @showcase.album_url, description: @showcase.description, header_img_url: @showcase.header_img_url, name: @showcase.name, slug: @showcase.slug, user_id: @showcase.user_id }
    end

    assert_redirected_to showcase_path(assigns(:showcase))
  end

  test "should show showcase" do
    get :show, id: @showcase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @showcase
    assert_response :success
  end

  test "should update showcase" do
    patch :update, id: @showcase, showcase: { album_url: @showcase.album_url, description: @showcase.description, header_img_url: @showcase.header_img_url, name: @showcase.name, slug: @showcase.slug, user_id: @showcase.user_id }
    assert_redirected_to showcase_path(assigns(:showcase))
  end

  test "should destroy showcase" do
    assert_difference('Showcase.count', -1) do
      delete :destroy, id: @showcase
    end

    assert_redirected_to showcases_path
  end
end
