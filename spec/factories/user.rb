FactoryBot.define do
  factory :user, class: User  do
    id { 1 }
    name { 'name1' }
    gender { 'フリー' }
    age { '2000' }
    email { 'email1@gmail.com' }
    password { 'password1' }
    password_confirmation { 'password1' }
    admin { true }
    after(:create) do |user|
      create_list(:assign, 1, user: user, group: create(:group))
    end
  end
  factory :second_user, class: User do
    id { 2 }
    name { 'name2' }
    gender { 'フリー' }
    age { '2000' }
    email { 'email2@gmail.com' }
    password { 'password2' }
    password_confirmation { 'password2' }
    admin { false }
    after(:create) do |user|
      create_list(:assign, 2, user: user, group: create(:group))
    end
  end
end