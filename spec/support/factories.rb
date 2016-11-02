FactoryGirl.define do
  factory :user do
    sequence(:username) {|n|  Faker::Name.name + "#{n}"}
    sequence(:email) {|n|  Faker::Internet.email + "#{n}"}
    sequence(:password) {|n|  Faker::Lorem.word + "#{n}"}

    factory :admin do
      role 1
    end
  end

  factory :category do
    sequence(:title) {|n|  Faker::Lorem.word + "#{n}" }
  end

  factory :idea do
    sequence(:content) {|n|  Faker::Lorem.word + "#{n}" }

    association :user
    association :category
  end


  # factory :image do
  #
  # end
end
