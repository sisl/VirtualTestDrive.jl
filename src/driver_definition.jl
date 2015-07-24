type DriverDefinition
    desired_velocity::Float64
    desired_acceleraion::Float64
    desired_deceleration::Float64
    curve_speed::Float64
    observe_speed_limits::Float64
    distance_keeping::Float64
    lane_keeping::Float64
    speed_keeping::Float64
    lane_change_dynamic::Float64
    urge_to_overtake::Float64
    keep_right_rule::Float64
    respond_to_tailgate::Float64
    foresight_distance::Float64
    steering_distance::Float64
    use_of_indicator::Float64
    obey_traffic_signs::Bool
    obey_traffic_lights::Bool
end

const BRISK_DRIVER = DriverDefinition(0.7,0.65,0.65,0.6,0.45,0.4,00.5,0.5,0.6,0.6,0.5,0.5,0.55,0.5,0.65,true,true)
const COMFORTABLE_DRIVER = DriverDefinition(0.45,0.4,0.4,0.4,0.6,0.55,0.5,0.5,0.45,0.4,0.5,0.5,0.6,0.4,0.75,true,true)
const DEFAULT_DRIVER = DriverDefinition(0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,true,true)
const HASTY_DRIVER = DriverDefinition(0.85,0.8,0.8,0.8,0.35,0.35,0.7,0.7,0.75,0.85,0.5,0.5,0.5,0.7,0.3,true,true)
const INSECURE_DRIVER = DriverDefinition(0.4,0.35,0.65,0.35,0.9,0.65,0.3,0.3,0.35,0.2,0.5,0.5,0.3,0.3,0.20,true,true)

function Base.copy(d::DriverDefinition)
    DriverDefinition(d.desired_velocity, d.desired_acceleraion, d.desired_deceleration, d.curve_speed,
        d.observe_speed_limits, d.distance_keeping, d.lane_keeping,d.speed_keeping,d.lane_change_dynamic,
        d.urge_to_overtake, d.keep_right_rule, d.respond_to_tailgate, d.foresight_distance, d. steering_distance,
        d. use_of_indicator, d.obey_traffic_signs, d.obey_traffic_lights)
end
