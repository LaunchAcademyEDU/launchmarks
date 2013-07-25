FactoryGirl.define do
  sequence :uid do |id|
    "uid-#{id}"
  end

  factory :user do
    sequence(:email){|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :facebook_identity, class: Identity do
    association :user
    sequence(:uid) {|n| n }
    provider 'facebook'
  end
end
