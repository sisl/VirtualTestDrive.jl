
#=
format: ASCII
The structure of the file is as follows:
    1 x comment line "# header"
    1 x comment line with labels of header variables
    1 x header (exactly 1 line):
    1 x common data
    n x configuration(s) of the players
    1 x comment line "# body"
    1 x comment line with labels of data block variables
    m x data set (exactly 1 line):
    1 x common data of simulation step
    n x data of the players

The following representations shall be used for the different data types:
    strings must be quoted ("OwnPlayer")
    floating point numbers shall be in scientific notation with 16 digits
    (0.1234567890123456E+4)
    integer numbers shall contain the relevant digits
    state masks are written as (unsigned) integer numbers
    The separator between data entries is a comma (,).
=#

type PlayerHeader
    ptype           :: Int     # player type
    id              :: Uint    # player ID
    name            :: String  # player name
    file            :: String  # ???
    length          :: Float64 # player length [m]         
    width           :: Float64 # player width [m]
    center_offset_x :: Float64 # x-offset between center of geometry and player reference point (in body frame) [m]
    center_offset_y :: Float64 # x-offset between center of geometry and player reference point (in body frame) [m]
    model           :: Int     # graphical model
    category        :: Uint    # category
    ctrl            :: Int     # controller type
    ctrl_arg        :: Int     # controller argument
    master          :: Int     # player acted as master in the simulation {0,1}

    PlayerHeader() = new()
end

type ViresCSV
    header::Dict{Symbol,String}
    player_headers::Vector{PlayerHeader}
    body::DataFrame
end

function read_vires_csv(pathname::String)
    open(pathname) do fin

        nbytes = filesize(pathname)

        line = readline(fin)
        nbytes -= length(line)
	    @assert(contains(line, "# header"))

        # extract header variables and put them in a dictionary Dict{Symbol,String}

        line = readline(fin)
        nbytes -= length(line)
        substrings = split(line, ",") # split_by_commas
        map!(str->replace(str, r"(^\s+|\s+\Z)", ""), substrings) # removed_leading_and_trailing_whitespace
        map!(str->replace(str, " ", "_"), substrings) # replace_spaces_with_underscores
        map!(str->replace(str, r"[.,]", ""), substrings) # remove periods and commas
        substrings = filter!(s->!isempty(s), substrings)
        dictkeys = map(str->symbol(str), substrings)

        line = readline(fin)
        nbytes -= length(line)
        substrings = String[]
        i = 1
        while i < length(line)
            k = findnext(line, '\"', i)
            if k != 0
                l = findnext(line, '\"', k+1)
                @assert(l > 0)
                append!(substrings, split(line[i:k-1]))
                push!(substrings, line[k+1:l-1])
                i = l+1
            else
                append!(substrings, split(line[i:end]))
                break
            end
        end

        map!(str->replace(str, r"(^\s+|\s+\Z)", ""), substrings) # removed_leading_and_trailing_whitespace
        map!(str->replace(str, " ", "_"), substrings) # replace_spaces_with_underscores
        map!(str->replace(str, r"[.,]", ""), substrings) # remove periods and commas
        dictvalues = filter(s->!isempty(s), substrings)

        # println(dictvalues)
        # println(length(dictkeys))
        # println(length(dictvalues))
        @assert(length(dictkeys) == length(dictvalues))

        player_headers = PlayerHeader[]

        header_variables = Dict{Symbol,String}()
        for (key,value) in zip(dictkeys, dictvalues)
            if key == :player_type
                push!(player_headers, PlayerHeader())
                player_headers[end].ptype = int(value)
            elseif key == :player_ID
                player_headers[end].id = int(value)
            elseif key == :player_name
                player_headers[end].name = value
            elseif key == :file_name
                player_headers[end].file = value
            elseif key == :file_length
                player_headers[end].length = float(value)
            elseif key == :player_width 
                player_headers[end].width = float(value)
            elseif key == :player_offset_x
                player_headers[end].offset_x = float(value)
            elseif key == :player_offset_y
                player_headers[end].ctr_offset_y = float(value)
            elseif key == :player_model
                player_headers[end].model = int(value)
            elseif key == :player_category
                player_headers[end].category = int(value)
            elseif key == :player_ctrl
                player_headers[end].ctrl = int(value)
            elseif key == :player_ctrl_arg
                player_headers[end].ctrl_arg = int(value)
            elseif key == :master
                player_headers[end].master = int(value)
            else
                header_variables[key] = value
            end
        end
        @assert(int(get(header_variables, :no_of_players, "0")) == length(player_headers))
        

        line = readline(fin)
        nbytes -= length(line)
        @assert(contains(line, "# body"))
        body = DataFrames.readtable(fin, nbytes; header=true)

        ViresCSV(header_variables, player_headers, body)
    end
end

inbounds(csv::ViresCSV, carind::Int, frameind::Int) = 
    carind_inbounds(csv, carind) && frameind_inbounds(csv, frameind)
carind_inbounds(csv::ViresCSV, carind::Int) = 0 ≤ carind < get_nplayers(csv)
frameind_inbounds(csv::ViresCSV, frameind::Int) = 1 ≤ frameind ≤ nrow(csv.body)

Base.get(csv::ViresCSV, frameind::Int, sym::Symbol) = csv.body[frameind, sym]
function Base.get(csv::ViresCSV, carind::Int, frameind::Int, str::String)
    @assert(carind_inbounds(csv, carind))
    @assert(frameind_inbounds(csv, frameind))
    sym = get_column_symbol(carind, str)
    csv.body[frameind, sym]
end
function set!(csv::ViresCSV, carind::Int, frameind::Int, str::String, value::Any)
    @assert(inbounds(csv, carind, frameind))
    str2 = get_column_symbol(carind, str)
    csv.body[frameind, str2] = value
    csv
end

get_nplayers(csv::ViresCSV) = length(csv.player_headers)
get_nframes(csv::ViresCSV) = nrow(csv.body)
function get_column_symbol(carind::Int, str::String)
    if carind != 0 # not ego car
        str = @sprintf("%s_%d", str, carind)
    end
    symbol(str)
end
function get_pos_inertial(csv::ViresCSV, carind::Int, frameind::Int)
    # returns a tuple, (x::Float64,y::Float64,z::Float64) in inertial for the vehicle
    x = get(csv, carind, frameind, "inertialX")::Float64
    y = get(csv, carind, frameind, "inertalY")::Float64
    z = get(csv, carind, frameind, "inertialZ")::Float64
    (x,y,z)
end
function get_orientation(csv::ViresCSV, carind::Int, frameind::Int)
    # returns a tuple, (heading::Float64,pitch::Float64,roll::Float64) in inertial for the vehicle
    h = get(csv, carind, frameind, "hdg")::Float64
    p = get(csv, carind, frameind, "pitch")::Float64
    r = get(csv, carind, frameind, "roll")::Float64
    (h,p,r)
end
function get_speed_body(csv::ViresCSV, carind::Int, frameind::Int)
    # returns a tuple, (vx::Float64,vy::Float64,vz::Float64) containing
    # the speed in [m/s] inertial for the vehicle
    vx = get(csv, carind, frameind, "vPlayerX")::Float64
    vy = get(csv, carind, frameind, "vPlayerY")::Float64
    vz = get(csv, carind, frameind, "vPlayerZ")::Float64
    (vx,vy,vz)
end
function get_inertial_rate(csv::ViresCSV, carind::Int, frameind::Int)
    # returns a tuple, (hdot::Float64,pdot::Float64,rdot::Float64)
    # containing the rate of change of orientation in the inertial frame for the vehicle
    dh = get(csv, carind, frameind, "hdgDot")::Float64
    dp = get(csv, carind, frameind, "pitchDot")::Float64
    dr = get(csv, carind, frameind, "rollDot")::Float64
    (dh,dp,dr)
end
function get_acceleration_body(csv::ViresCSV, carind::Int, frameind::Int)
    # returns a tuple, (ax::Float64,ay::Float64,az::Float64) containing
    # the speed in [m/s] inertial for the vehicle
    ax = get(csv, carind, frameind, "aPlayerX")::Float64
    ay = get(csv, carind, frameind, "aPlayerY")::Float64
    az = get(csv, carind, frameind, "aPlayerZ")::Float64
    (ax,ay,az)
end

function _euler2quat( roll::Real, pitch::Real, yaw::Real )

    #=
    Converts roll, pitch, yaw in radians to the corresponding unit quaternion (w,x,y,z)
    =#

    cr = cos(0.5roll)
    sr = sin(0.5roll)
    cp = cos(0.5pitch)
    sp = sin(0.5pitch)
    cy = cos(0.5yaw)
    sy = sin(0.5yaw)

    w2 = cr*cp*cy + sr*sp*sy
    x2 = sr*cp*cy - cr*sp*sy
    y2 = cr*sp*cy + sr*cp*sy
    z2 = cr*cp*sy - sr*sp*cy

    return [w2, x2, y2, z2]
end
function _global2ego( egocarGx::Real, egocarGy::Real, egocarYaw::Real, posGx::Real, posGy::Real )

    #=
    Convert an (x,y) in inertial coordinates to (x,y) relative to the ego vehicle's body frame
    =#

    # translate to be relative to ego car
    pt = [posGx-egocarGx, posGy-egocarGy]

    # rotate to be in ego car frame
    cθ, sθ = cos(egocarYaw), sin(egocarYaw)
    R = [ cθ sθ;
         -sθ cθ]
    pt = R*pt

    return (pt[1], pt[2]) # posEx, posEy
end
function _ego2global(egocarGx::Real, egocarGy::Real, egocarYaw::Real, posEx::Real, posEy::Real )

    #=
    Convert an (x,y) in body coordinates to (x,y) relative to the global frame
    =#

    pt = [posEx, posEy]
    eo = [egocarGx, egocarGy]

    # rotate
    c, s = cos(egocarYaw), sin(egocarYaw)
    R = [ c -s;
          s  c]
    pt = R*pt

    # translate
    pt += eo

    (pt[1], pt[2]) # posGx, posGy
end

end
function export_to_bosch_csv(io::IO, csv::ViresCSV;
    start_frame::Int=5, # first frame to export
    end_frame::Int=get_nframes(csv) # last frame to export
    )
    #=
    Exports the ViresCSV to a csv file following the Bosch CSV format.
    The Bosch CSV format (made by Jorge), is a CSV file with the following columns:

    entry                          row number, starting at 0
    timings                        frame time, unix epoch
    status                         ego vehicle status (99=CONTROL_STATUS_VIRES_AUTO for ghostdriver)
    global position x/y/z          3 columns, one for each of the inertial coordinates, [m]
    global rotation w/x/y/z        quaternion defining the vehicle orientation in global coordinates
    odom velocity x/y/z            ego velocity in the body frame [m/s]
    odom acceleration x/y/z        ego acceleration in the body frame [m/s²]
    lane                           deprecated
    offsetwrtcenterline            deprecated
    closest centerline point x/y   deprecated
    right lane x/y                 deprecated
    # repeated for a number of extra vehicles, with increasing digit, starting at 0
    car id0                        vehicle unique id, integer
    ego x0/y0                      vehicle ego-relative position [m]
    v x0/yo                        vehicle ego-relative velocity [m/s]
    global x0/y0                   vehicle global position [m]
    global v_x0/v_y0               vehicle global velocity [m/s]
    car angle0                     vehicle heading w.r.t global
    lane0                          deprecated
    offset wrt centerline0         deprecated
    tangent theta0                 deprecated
    angle to lane0                 deprecated
    lane v_x0                      deprecated
    lane v_y0                      deprecated
    lane x0                        deprecated
    lane y0                        deprecated
    kappa0                         deprecated
    kappa_prime0                   deprecated
    reference lane0                deprecated
    reference lane x0              deprecated
    reference lane y0              deprecated
    =#

    CONTROL_STATUS_VIRES_AUTO = 99

    n_other_cars = get_nplayers(csv) - 1
    print(io, "entry, timings, status, global position x, global position y, global position z, global rotation w,global rotation x, global rotation y, global rotation z, odom velocity x, odom velocity y, odom velocity z, odom acceleration x, odom acceleration y, odom acceleration z, lane, offsetwrtcenterline, closest centerline point x, closest centerline point y, right lane x, right lane y")
    for i = 1 : n_other_cars
        id = i-1
        print(io, ",car id$(id),ego x$(id),ego y$(id),v x$(id),v y$(id),global x$(id),global y$(id),global v_x$(id),global v_y$(id),car angle$(id),lane$(id),offset wrt centerline$(id),tangent theta$(id),angle to lane$(id),lane v_x$(id),lane v_y$(id),lane x$(id),lane y$(id),kappa$(id),kappa_prime$(id),reference lane$(id),reference lane x$(id),reference lane y$(id)",)
    end
    print(io, "\n")

    export_frameind_count = 0
    for i = start_frame : end_frame
        x,y,z = get_pos_inertial(csv, 0, i)
        h,p,r = get_orientation(csv, 0, i)
        quat = _euler2quat(r, p, h)
        vx,vy,vz = get_speed_body(csv, 0, i)
        ax,ay,az = get_acceleration_body(csv, 0, i)
        vxi,vyi = _ego2global(0,0,h,vx,vy)

        print(io, export_frameind_count, ",", get(csv, i, :_simTime), ",", CONTROL_STATUS_VIRES_AUTO, ",", x, ",", y,
            ",", z, ",", quat[1], ",", quat[2], ",", quat[3], ",", quat[4], ",", vx, ",", vy, ",",
            vz, ",", ax, ",", ay, ",", az, ",", 1, ",", 0.0, ",", 0.0, ",", 0.0, ",", 0.0, ",", 0.0)

        for j = 1 : n_other_cars
            id = j-1
            cx,cy,cz = get_pos_inertial(csv, j, i)
            cvx,cvy,cvz = get_speed_body(csv, j, i)
            ex,ey = _global2ego(x, y, h, cx, cy)
            evx,evy = _global2ego(vxi, vyi, h, cvx, cvy)
            velEx = evx + vx # NOTE(tim): in the ego frame but not a relative speed
            velEy = evy + vy

            print(io, ",", id, ",", ex, ",", ey, ",", velEx, ",", velEy, ",", cx, ",", vy, ",",
                  cvx, ",", cvy, ",", get(csv, j, i, "hdg"), ",", 1, ",", 0.0, ",", 0.0, ",",
                  0.0, ",", 0.0, ",", 0.0, ",", 0.0, ",", 0.0, ",", 0.0, ",", 0.0, ",", 0.0, ",", 0.0, ",", 0.0)
        end
        print(io, "\n")

        export_frameind_count += 1
    end
end