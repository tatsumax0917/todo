require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = FactoryBot.create(:user)
  end

  test "ログインしていなければusers/topを表示" do
    get root_path
    assert_template 'users/top'
  end

  test "ログインしていればtasks/indexを表示" do
    # ログインする
    sign_in @user
    get root_path
    follow_redirect!
    assert_template 'tasks/index'
  end

end
