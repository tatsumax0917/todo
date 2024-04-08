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

  # name
  test "名前が空のなら無効" do
    @user.name = ""
    assert_not @user.valid?
  end

  # email
  test "メールアドレスが空なら無効" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "メールアドレスの形式が不正だったら無効" do
    @user.email = "hogehoge@hogehoge"
    assert_not @user.valid?
  end

  # password
  test "パスワードが空なら無効" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "パスワードが8文字以下だったら無効" do
    @user.password = 'a' * 5
    assert_not @user.valid?
  end

end
