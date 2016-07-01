=begin
FactoryGirl.define do
  factory :vote do

    trait :up do
      value 1
    end

    trait :down do
      value -1

    trait :post do
      association :votable, factory: :post
    end

    trait :comment do
      association :votable, factory: :comment
    end

    factory :up_post,       traits: [:up, :post]
    factory :down_post,     traits: [:down, :post]
    factory :up_comment,    traits: [:up, :comment]
    factory :down_comment,  traits: [:down, :comment]
  end
end
=end

=begin

FactoryGirl.define do
  factory :contact do |f|
    f.name { Faker::Name.name }
    phone association :store, :factory => [:store, :unknown]

    trait :foodie_contact do
      association :store, :factory => [:store, :restaurant]
    end

    trait :retailer_contact do
      association :store, :factory => [:store, :retailer]
    end
  end
end

=end


=begin

factory :user do
  trait :with_profile do
    name "John Doe"
  end
end

factory :subscription do
  association :user, :traits => [:with_profile]
end

=end