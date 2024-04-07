require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: "tanaka", email: "tanaka@gmail.com",
                        password: "tanakatanaka", password_confirmation: "tanakatanaka")
  end

  test "@userの有効性の確認" do
    assert @user.valid?
  end

  test "nameが空欄だとエラーになる" do
    @user.name = ""
    assert_not @user.valid?
  end
end
