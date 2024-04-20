require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  def setup
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task, user: @user)
  end

  test "新規登録時のテスト" do
    user_attributes = { name: "Test User", email: "test@example.com", password: "password", password_confirmation: "password" }
    get new_user_registration_path
    assert_response :success
    post user_registration_path, params: { user: user_attributes }
    assert_response :redirect
    follow_redirect!
    assert_redirected_to tasks_path
    assert_not flash.empty?
  end

  test "ログイン時の画面遷移" do
    user_attr = { name: @user.name, password: @user.password }
    get new_user_session_path
    assert_template 'devise/sessions/new'
    post user_session_path, params: { user: user_attr }
    sign_in @user
    assert_redirected_to root_path
    follow_redirect!
    assert_redirected_to tasks_path
    follow_redirect!
    assert_template 'tasks/index'
    assert_not flash.empty?
    assert_select "form input[type=text]"
  end

  test "ログアウト時の画面遷移" do
    user_attr = { name: @user.name, password: @user.password }
    sign_in @user
    get root_path
    assert_redirected_to tasks_path
    delete destroy_user_session_path, params: { user: user_attr }
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'users/top'
    assert_not flash.empty?
  end


end
