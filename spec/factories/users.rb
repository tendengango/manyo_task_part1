FactoryBot.define do
  factory :user do
    name { "user2" }
    email { "user2@gmail.com" }
    password { "12345678" }
    password_confirmation { "12345678" }
    admin { false }
  end
  factory :adminuser do
    name { "user3" }
    email { "user3@gmail.com" }
    password { "12345678" }
    password_confirmation { "12345678" }
    admin_user { true }
  end

  factory :user_with_tasks do
    after(:create) do |user|
      create_list(:task, 50, user: user)
    end
  end

end
