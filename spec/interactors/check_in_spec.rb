require "rails_helper"

describe CheckIn do
  let!(:user) { FactoryGirl.create :user }
  let!(:location) { FactoryGirl.create :location }
  let!(:mission) { FactoryGirl.create :mission, start_location: location }

  context "start a mission" do
    it "creates a mission session" do
      expect {
        CheckIn.call(user: user, location: location)
      }.to change { MissionSession.count }.by(1)
    end
  end

  context "failure" do
    it "returns a error if the user has a running session and the location is a start" do
      FactoryGirl.create :mission_session, user: user, status: :started

      result = CheckIn.call(user: user, location: location)
      expect(result).to be_a_failure
    end
  end
end
