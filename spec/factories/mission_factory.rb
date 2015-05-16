FactoryGirl.define do
  factory :mission do
    name "Mission"
    association :start_location, factory: :location
    association :end_location, factory: :location
  end
end
