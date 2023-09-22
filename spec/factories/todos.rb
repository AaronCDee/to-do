FactoryBot.define do
  factory :todo do
    description { "MyString" }
    complete { false }
    deadline { "2023-09-05 22:05:35" }

    # Define an optional user association
    association :user, factory: :user
  end
end
