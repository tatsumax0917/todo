class DeviseMailerPreview < ActionMailer::Preview
  def confirmation_instructions
    user = User.first
    Devise::Mailer.confirmation_instructions(user, "faketoken", {})
  end

  def reset_password_instructions
    user = User.first
    Devise::Mailer.reset_password_instructions(user, "faketoken", {})
  end

  # 他のDeviseのメールについても同様に定義します。
end
