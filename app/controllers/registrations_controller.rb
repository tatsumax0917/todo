class RegistrationsController < Devise::RegistrationsController
  # 基本的にはアクセス制限
  before_action :logged_in?, except: [:new, :create]
  # ログインしているユーザーでも/users/cancelにアクセスできるようにする
  skip_before_action :require_no_authentication, only: [:cancel]

  def cancel
  end

  def update
    # パスワードの確認をスキップしてメールアドレスを更新する
    if params[:user][:password].empty?
      resource.update_without_password(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to edit_user_registration_path
    else
      if resource.update_with_password(password_params)
      flash[:notice] = "パスワードが変更されましたので再度ログインしてください"
      redirect_to new_user_session_path
      else
        flash.now[:alert] = "パスワードを正しく入力してください"
        render 'devise/registrations/edit', status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def password_params
    params.require(:user).permit(:name, :email, :current_password, :password, :password_confirmation)
  end
end
