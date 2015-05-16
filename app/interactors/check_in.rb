class CheckIn
  include Troupe

  expects :user, :location
  permits :user, :location

  def call
    if running_mission?
      complete_mission
    else
      start_mission
    end
  end

  private

  def start_mission
    if location.id == mission.start_location_id
      context.session = MissionSession.create(user: user, mission: mission)
    else
      context.fail!(errors: ["You can only start a mission at the start"])
    end
  end

  def complete_mission
    if location.id == mission.end_location_id
      running_mission.update(
        status: "completed",
        completed_at: Time.current
      )

      context.session = running_mission.reload
    else
      context.fail!(errors: ["You have to complete your last mission before you can start a new one"])
    end
  end

  def mission
    Mission.where("start_location_id = :location OR end_location_id = :location", location: location.id).take
  end

  def running_mission
    @running_mission ||= user.mission_sessions.where(status: "started").take
  end

  def running_mission?
    running_mission.present?
  end
end
