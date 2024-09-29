require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task, user: @user)
  end

  test "Taskの有効性の検証" do
    content = 'a' * 50
    ok_task = Task.new(content: content, user_id: @user.id)
    assert ok_task.valid?
    content = 'a' * 51
    ng_task = Task.new(content: content, user_id: @user.id)
    assert_not ng_task.valid?
  end

  test "タスク登録（成功）" do
    content = 'a' * 50
    task = Task.new(content: content, user_id: @user.id)
    assert_difference 'Task.count', 1 do
      task.save
    end
  end

  test "タスク登録（失敗）" do
    content = 'a' * 51
    task = Task.new(content: content, user_id: @user.id)
    assert_no_difference 'Task.count' do
      task.save
    end
  end

  test "タスク削除ボタンの動作確認(成功)" do
    assert_difference 'Task.count', -1 do
      @task.destroy
    end
  end

end
