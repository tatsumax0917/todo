class UsersController < ApplicationController
  def top
    if user_signed_in?
      redirect_to tasks_path
    else
      render 'users/top'
    end

  end
end
