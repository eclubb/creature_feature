FactoryGirl.define do
  factory :feature do
    sequence(:name) { |n| "Feature #{n}" }
  end
end
