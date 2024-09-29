class RegistrationsController < Devise::RegistrationsController
  # 基本的にはアクセス制限
  before_action :logged_in?, except: [:new, :create]
  # ログインしているユーザーでも/users/cancelにアクセスできるようにする
  skip_before_action :require_no_authentication, only: [:cancel]

  def cancel
  end


  def update
    # 現在のパスワードの入力が必須であることを確認
    if params[:user][:current_password].blank?
      # 現在のパスワードが空の場合はエラーメッセージを追加して再度表示する
      resource.errors.add(:current_password)
      render :edit, status: :unprocessable_entity
      return
    end
    resource.update_without_password(user_params)

    super
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end


end
