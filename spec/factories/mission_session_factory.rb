FactoryGirl.define do
  factory :mission_session do
    mission
    user
    started_at { Time.current }
  end
end
