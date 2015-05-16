require "rails_helper"

describe CheckIn do
  let!(:user) { FactoryGirl.create :user }
  let!(:mission) { FactoryGirl.create :mission }

  context "start a mission" do
    it "creates a mission session" do
      expect {
        CheckIn.call(user: user, location: mission.start_location)
      }.to change { MissionSession.count }.by(1)
    end

    it "returns a error if the location is a end" do
      result = CheckIn.call(user: user, location: mission.end_location)
      expect(result).to be_a_failure
    end
  end

  context "complete a mission" do
    let!(:running_session) { FactoryGirl.create :mission_session, user: user }

    it "changes the status to completed" do
      CheckIn.call(user: user, location: mission.end_location)
      expect(running_session.reload.status).to eq("completed")
    end

    it "updates the completed_at timestamp" do
      CheckIn.call(user: user, location: mission.end_location)
      expect(running_session.reload.completed_at).to_not be_nil
    end

    it "returns a error if the location is a start" do
      result = CheckIn.call(user: user, location: mission.start_location)
      expect(result).to be_a_failure
    end
  end
end
