require 'faker'

FactoryGirl.define do
  factory :contact do |f|
    f.email { Faker::Name.email }
  end
end

FactoryGirl.define do
  factory :contato do |f|
    f.email "asdfa@asdf.com"
  end
end