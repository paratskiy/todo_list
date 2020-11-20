FactoryBot.define do
  factory :task do
    name { "MyString" }
    status { false }
    project { nil }
  end
end
