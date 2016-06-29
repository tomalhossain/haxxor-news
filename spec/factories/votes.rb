FactoryGirl.define do
  factory :vote do
    value 0
    association :commentable, factory: :user
  end
end
