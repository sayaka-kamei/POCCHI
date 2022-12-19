FactoryBot.define do
  factory :assign do
    association :user
    association :group
  end
end