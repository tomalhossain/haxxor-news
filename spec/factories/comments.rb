FactoryGirl.define do

  factory :comment do
    content "This is a sample comment."
    association :commentable, factory: :user
  end

end
