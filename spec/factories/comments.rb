require 'faker'

FactoryGirl.define do
  factory :comment do
    content Faker::Lorem.paragraph(1)

    trait :for_post do
      association :commentable, factory: :post
    end

    trait :for_comment do
      association :commentable, factory: :comment
    end

    factory :comment_for_post,      traits: [:for_post]
    factory :comment_for_comment,   traits: [:for_comment]
  end
end
