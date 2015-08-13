get_xml_simctrl_step(nsteps::Int) = @sprintf("<SimCtrl><Step size=\"%d\"/></SimCtrl>", nsteps)
get_xml_simctrl_loadscenario(scenario::String) = "<SimCtrl><LoadScenario filename=\""*scenario*"\"/></SimCtrl>"
function get_xml_simctrl_loadscenario(scenario::ETree)
    @assert(scenario.name == "Scenario")

    retval = ETree("SimCtrl")
    loadscenario = ETree("LoadScenario")
    push!(loadscenario.elements, scenario)
    push!(retval.elements, loadscenario)

    string(retval)
end
get_xml_simctrl_load_init(scenario::String) = "<SimCtrl><LoadScenario filename=\""*scenario*"\"/><Init/></SimCtrl>"
get_xml_simctrl_init() = "<SimCtrl><Init/></SimCtrl>"
function get_xml_simctrl_init(mode::Symbol) # ∈ {:preparation, :operation}
    @assert(mode == :preparation || mode == :operation)
    "<SimCtrl><Init mode=\"" * string(mode) * "\"/></SimCtrl>"
end
function get_xml_simctrl_load_init(scenario::String, initmode::Symbol)
    @assert(initmode == :preparation || initmode == :operation)
    "<SimCtrl><LoadScenario filename=\""*scenario*"\"/><Init mode=\""*string(initmode)*"\"/></SimCtrl>"
end
function get_xml_simctrl_load_init(scenario::ETree, initmode::Union(Nothing,Symbol)=nothing)
    @assert(scenario.name == "Scenario")

    retval = ETree("SimCtrl")

    loadscenario = ETree("LoadScenario")
    push!(loadscenario.elements, scenario)
    push!(retval.elements, loadscenario)

    init = ETree("Init")
    if isa(initmode, Symbol)
        @assert(initmode == :preparation || initmode == :operation)
        init.attr["mode"] = string(initmode)
    end
    push!(retval.elements, init)

    string(retval)
end

get_xml_record_overwrite(dir::String, file_dat::String) = "<Record stream=\"simulation\"><File path=\""*dir*"\" name=\""*file_dat*"\" overwrite=\"true\"/><Start/></Record>"
get_xml_replay_convert(dir::String, file_dat::String) = "<Replay><File path=\""*dir*"\"  name=\""*file_dat*"\"/><Convert format=\"CSV\"/></Replay>"
get_xml_record_stop() = "<Record stream=\"simulation\"><Stop/></Record>"
get_xml_egoctrl_speed(speed::Float64) = @sprintf("<EgoCtrl><Speed value=\"%f\"/></EgoCtrl>", speed)

function get_xml_set_pos_inertial(
    id::Int,
    x::Real, # [m]
    y::Real, # [m]
    z::Real, # [m]
    hDeg::Real, # [Deg]
    pDeg::Real, # [Deg]
    rDeg::Real # [Deg]
    )

    @sprintf("<Set entity=\"player\" id=\"%d\"><PosInertial x=\"%f\" y=\"%f\" z=\"%f\" hDeg=\"%f\" pDeg=\"%f\" rDeg=\"%f\"/></Set>",
        id, x, y, z, hDeg, pDeg, rDeg)
end
get_xml_set_speed(id::Int, speed::Float64) = @sprintf("<Set entity=\"player\" id=\"%d\"><Speed value=\"%f\"/></Set>", id, speed)
get_xml_set_speed(name::String, speed::Float64) = @sprintf("<Set entity=\"player\" name=\"%s\"><Speed value=\"%f\"/></Set>", name, speed)
get_xml_set_path(id::Int, pathid::Int, s::Real) = @sprintf("<Set entity=\"player\" id=\"%d\"><Path id=\"%d\" s=\"%f\"/></Set>", id, pathid, s)


get_xml_query(entity::String, id::Int) = @sprintf("<Query entity=\"%s\" id=\"%d\"> </Query>", entity, id)
get_xml_query_path(entity::String, id::Int) = @sprintf("<Query entity=\"%s\" id=\"%d\"><Path/></Query>", entity, id)
get_xml_query_posinertial() = "<Query entity=\"player\" id=\"1\"><PosInertial/></Query>"
function get_xml_query_sync(;
    entity::String="RDB",
    source::String="USER",
    delete::Bool=false
    )

    if !delete
        "<Query entity=\""*entity*"\"><Sync source=\""*source*"\"/></Query>"
    else
        "<Query entity=\""*entity*"\"><Sync source=\""*source*"\" delete=\"true\"/></Query>"
    end
end


function get_xml_player_driver_behavior_normalized(
    def::DriverBehavior; 
    name::Union(Nothing,String)=nothing,
    id::Union(Nothing,Int)=nothing,
    visible::Union(Nothing,Bool)=nothing
    )
    retval = "<Player"
    if isa(name,String)
        retval *= @sprintf(" name=\"%s\"", name)
    end
    if isa(id,Int)
        retval *= @sprintf(" id=\"%d\"", id)
    end
    if isa(visible,Bool)
        retval *= @sprintf(" visible=\"%s\"", visible)
    end
    #NOTE(Deon) not passing in use_of_indicator because its not in the API
    @sprintf("%s><DriverBehaviorNormalized desiredSpeed=\"%f\" desiredAcc=\"%f\" desiredDec=\"%f\" curveSpeed=\"%f\" observeSpeedLimits=\"%f\" distanceKeeping=\"%f\" laneKeeping=\"%f\" speedKeeping=\"%f\" laneChangeDyn=\"%f\" urgeToOvertake=\"%f\" keepRightRule=\"%f\" respondToTailgating=\"%f\" foresightDist=\"%f\" steeringDist=\"%f\" obeyTrafficSigns=\"%s\" obeyTrafficLights=\"%s\"/></Player>",
        retval, def.desired_speed, def.desired_acceleraion, def.desired_deceleration,
        def.curve_speed, def.observe_speed_limits, def.distance_keeping, def.lane_keeping,
        def.speed_keeping, def.lane_change_dynamic, def.urge_to_overtake, def.keep_right_rule,
        def.respond_to_tailgate, def.foresight_distance, def.steering_distance,
        int(def.obey_traffic_signs), int(def.obey_traffic_lights)
    )
end
function get_xml_player_driver_input(;
    name::Union(Nothing,String)=nothing,
    id::Union(Nothing,Int)=nothing,
    visible::Union(Nothing,Bool)=nothing,
    override::Union(Nothing,Bool)=nothing,
    throttle::Union(Nothing,Float64)=nothing,
    brake::Union(Nothing,Float64)=nothing
    )

    @assert(isa(override,Bool) || isa(throttle,Float64) || isa(brake, Float64))

    retval = "<Player"
    if isa(name,String)
        retval *= @sprintf(" name=\"%s\"", name)
    end
    if isa(id,Int)
        retval *= @sprintf(" id=\"%d\"", id)
    end
    if isa(visible,Bool)
        retval *= @sprintf(" visible=\"%s\"", visible)
    end

    input_str ="" 
    if isa(override,Bool)
        input_str *= @sprintf(" override=\"%s\"",override)
    end
    if isa(throttle,Float64)
        if throttle < 0.0
            throttle = 0.0
            warn("Throttle value set to 0")
        elseif throttle > 1.0
            throttle = 1.0
            warn("Throttle value set to 1")
        end
        input_str *= @sprintf(" throttle=\"%f\"", throttle)
    end
    if isa(brake, Float64)
        if brake < 0.0
            brake = 0.0
            warn("brake value set to 0")
        elseif brake > 1.0
            brake = 1.0
            warn("brake value set to 1")
        end
        input_str *= @sprintf(" brake=\"%f\"", brake)
    end
    @sprintf("%s><DriverInput%s/></Player>", retval, input_str)
end
# function get_xml_player_driver(;
#     name::Union(Nothing,String)=nothing,
#     id::Union(Nothing,Int)=nothing,
#     visible::Union(Nothing,Bool)=nothing,
#     ctrlLatLong::Union(Nothing,Symbol)=nothing, # ∈ :ghostdriver, extern, none
#     throttle::Union(Nothing,Float64)=nothing,
#     brake::Union(Nothing,Float64)=nothing
#     )

#     @assert(isa(override,Bool) || isa(throttle,Float64) || isa(brake, Float64))

#     retval = "<Player"
#     if isa(name,String)
#         retval *= @sprintf(" name=\"%s\"", name)
#     end
#     if isa(id,Int)
#         retval *= @sprintf(" id=\"%d\"", id)
#     end
#     if isa(visible,Bool)
#         retval *= @sprintf(" visible=\"%s\"", visible)
#     end

#     input_str ="" 
#     if isa(override,Bool)
#         input_str *= @sprintf(" override=\"%s\"",override)
#     end
#     if isa(throttle,Float64)
#         if throttle < 0.0
#             throttle = 0.0
#             warn("Throttle value set to 0")
#         elseif throttle > 1.0
#             throttle = 1.0
#             warn("Throttle value set to 1")
#         end
#         input_str *= @sprintf(" throttle=\"%f\"", throttle)
#     end
#     if isa(brake, Float64)
#         if brake < 0.0
#             brake = 0.0
#             warn("brake value set to 0")
#         elseif brake > 1.0
#             brake = 1.0
#             warn("brake value set to 1")
#         end
#         input_str *= @sprintf(" brake=\"%f\"", brake)
#     end
#     @sprintf("%s><DriverInput%s/></Player>", retval, input_str)
# end

get_xml_traffic_trigger(id::String, active::Bool) = @sprintf("<Traffic><Trigger id=\"%s\" active=\"%s\"/></Traffic>", id, active)
function get_xml_traffic_action_autonomous(actor::String; 
    enable::Bool=true,
    force::Bool=true,
    delayTime::Union(Nothing,Real)=nothing,
    triggerRef::Union(Nothing,String)=nothing,
    activateOnExit::Union(Nothing,Bool)=nothing
    )

    retval = @sprintf("<Traffic><ActionAutonomous actor=\"%s\" enable=\"%s\" force=\"%s\"",
                       actor, enable, force)

    if isa(delayTime,String)
        retval *= @sprintf(" delayTime=\"%f\"", delayTime)
    end
    if isa(triggerRef, String)
        retval *= " triggerRef=\"" *triggerRef * "\""
    end
    if isa(activateOnExit,Bool)
        retval *= @sprintf(" activateOnExit=\"%s\"", activateOnExit)
    end 

    retval * "/></Traffic>"
end
function get_xml_traffic_action_speedchange(
    actor::String,
    target_speed::Float64, # [m/s]
    accel_to_use::Float64; # [m/s²]
    pivot::Union(Nothing,String)=nothing,
    force::Bool=true,
    delayTime::Union(Nothing,Float64)=nothing,
    triggerRef::Union(Nothing,String)=nothing,
    activateOnExit::Union(Nothing,Bool)=nothing
    )

    retval = @sprintf("<Traffic><ActionSpeedChange actor=\"%s\" target=\"%f\" rate=\"%f\" force=\"%s\"",
                       actor, target_speed, accel_to_use, force)

    if isa(pivot,String)
        retval *= " pivot=\"" * pivot * "\""
    end
    if isa(delayTime,String)
        retval *= " delayTime=\"" * delayTime * "\""
    end
    if isa(triggerRef, String)
        retval *= " triggerRef=\"" *triggerRef * "\""
    end
    if isa(activateOnExit,Bool)
        retval *= @sprintf(" activateOnExit=\"%s\"", activateOnExit)
    end 

    retval * "/></Traffic>"
end