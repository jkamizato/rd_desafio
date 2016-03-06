require 'faker'

FactoryGirl.define do
  factory :contato do |f|
    f.email "exemplo@email.com"
  end
end