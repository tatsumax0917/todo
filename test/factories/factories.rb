FactoryBot.define do
  factory :user do
    name { "tanaka" }
    email { "tanaka@gmail.com" }
    password { "tanakatanaka"}
  end
end

FactoryBot.define do
  factory :task do
    content { "テスト投稿" }
    done { false }
    association :user
  end
end

# 複数のUserモデルのテストデータ定義
# FactoryBot.define do
#   factory :user do
#     name { "John Doe" }
#     email { "john@example.com" }
#     password { "password" }
#   end

#   factory :admin_user, class: User do
#     name { "Admin User" }
#     email { "admin@example.com" }
#     password { "admin_password" }
#     admin { true }
#   end
# end
