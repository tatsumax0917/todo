require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  def setup
    @user = FactoryBot.create(:user)
  end

  test "ログイン時～ログアウト時の動作" do
    get root_path
    assert_template 'users/top'
    get new_user_session_path
    assert_template 'devise/sessions/new'
    post user_session_path, params: { user: { name: @user.name,
                                              password: @user.password } }
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'users/top'
    assert_not flash.empty?
    delete destroy_user_session_path
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'users/top'
    assert_not flash.empty?
  end
end
