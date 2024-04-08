require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    # @user = User.create(name: "tanaka", email: "tanaka@gmail.com",
    #                     password: "tanakatanaka", password_confirmation: "tanakatanaka")
    @user = FactoryBot.build(:user)
  end

  test "ユーザーの有効性の確認する" do
    assert @user.valid?
  end

  test "名前が空の場合に無効であることあることを検証する" do
    @user.name = ""
    assert_not @user.valid?
  end
end
