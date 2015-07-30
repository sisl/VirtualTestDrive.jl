# NOTE(tim): these definitions were automatically extracted from viRDBIcd.h
#            using VirtualTestDrive/dev/extract_defines.jl

const RDB_DEFAULT_PORT = convert(Cint, 48190)
const RDB_FEEDBACK_PORT = convert(Cint, 48191)
const RDB_IMAGE_PORT = convert(Cint, 48192)
const RDB_MAGIC_NO = convert(Cint, 35712)
const RDB_VERSION = @compat UInt16(0x0118)
const RDB_SIZE_OBJECT_NAME = convert(Cint, 32)
const RDB_SIZE_SCP_NAME = convert(Cint, 64)
const RDB_SIZE_FILENAME = convert(Cint, 1024)
const RDB_SIZE_TRLIGHT_PHASES = convert(Cint, 8)
const RDB_PKG_ID_START_OF_FRAME = convert(Cint, 1)
const RDB_PKG_ID_END_OF_FRAME = convert(Cint, 2)
const RDB_PKG_ID_COORD_SYSTEM = convert(Cint, 3)
const RDB_PKG_ID_COORD = convert(Cint, 4)
const RDB_PKG_ID_ROAD_POS = convert(Cint, 5)
const RDB_PKG_ID_LANE_INFO = convert(Cint, 6)
const RDB_PKG_ID_ROADMARK = convert(Cint, 7)
const RDB_PKG_ID_OBJECT_CFG = convert(Cint, 8)
const RDB_PKG_ID_OBJECT_STATE = convert(Cint, 9)
const RDB_PKG_ID_VEHICLE_SYSTEMS = convert(Cint, 10)
const RDB_PKG_ID_VEHICLE_SETUP = convert(Cint, 11)
const RDB_PKG_ID_ENGINE = convert(Cint, 12)
const RDB_PKG_ID_DRIVETRAIN = convert(Cint, 13)
const RDB_PKG_ID_WHEEL = convert(Cint, 14)
const RDB_PKG_ID_PED_ANIMATION = convert(Cint, 15)
const RDB_PKG_ID_SENSOR_STATE = convert(Cint, 16)
const RDB_PKG_ID_SENSOR_OBJECT = convert(Cint, 17)
const RDB_PKG_ID_CAMERA = convert(Cint, 18)
const RDB_PKG_ID_CONTACT_POINT = convert(Cint, 19)
const RDB_PKG_ID_TRAFFIC_SIGN = convert(Cint, 20)
const RDB_PKG_ID_ROAD_STATE = convert(Cint, 21)
const RDB_PKG_ID_IMAGE = convert(Cint, 22)
const RDB_PKG_ID_LIGHT_SOURCE = convert(Cint, 23)
const RDB_PKG_ID_ENVIRONMENT = convert(Cint, 24)
const RDB_PKG_ID_TRIGGER = convert(Cint, 25)
const RDB_PKG_ID_DRIVER_CTRL = convert(Cint, 26)
const RDB_PKG_ID_TRAFFIC_LIGHT = convert(Cint, 27)
const RDB_PKG_ID_SYNC = convert(Cint, 28)
const RDB_PKG_ID_DRIVER_PERCEPTION = convert(Cint, 29)
const RDB_PKG_ID_LIGHT_MAP = convert(Cint, 30)
const RDB_PKG_ID_TONE_MAPPING = convert(Cint, 31)
const RDB_PKG_ID_ROAD_QUERY = convert(Cint, 32)
const RDB_PKG_ID_SCP = convert(Cint, 33)
const RDB_PKG_ID_TRAJECTORY = convert(Cint, 34)
const RDB_PKG_ID_DYN_2_STEER = convert(Cint, 35)
const RDB_PKG_ID_STEER_2_DYN = convert(Cint, 36)
const RDB_PKG_ID_PROXY = convert(Cint, 37)
const RDB_PKG_ID_MOTION_SYSTEM = convert(Cint, 38)
const RDB_PKG_ID_OCCLUSION_MATRIX = convert(Cint, 39)
const RDB_PKG_ID_CUSTOM_SCORING = convert(Cint, 10000)
const RDB_PKG_ID_CUSTOM_AUDI_FORUM = convert(Cint, 12000)
const RDB_PKG_ID_CUSTOM_OPTIX_START = convert(Cint, 12100)
const RDB_PKG_ID_OPTIX_BUFFER = convert(Cint, 12101)
const RDB_PKG_ID_CUSTOM_OPTIX_END = convert(Cint, 12149)
const RDB_PKG_ID_CUSTOM_USER_A_START = convert(Cint, 12150)
const RDB_PKG_ID_CUSTOM_USER_A_END = convert(Cint, 12174)
const RDB_OBJECT_CATEGORY_NONE = convert(Cint, 0)
const RDB_OBJECT_CATEGORY_PLAYER = convert(Cint, 1)
const RDB_OBJECT_CATEGORY_SENSOR = convert(Cint, 2)
const RDB_OBJECT_CATEGORY_CAMERA = convert(Cint, 3)
const RDB_OBJECT_CATEGORY_LIGHT_POINT = convert(Cint, 4)
const RDB_OBJECT_CATEGORY_COMMON = convert(Cint, 5)
const RDB_OBJECT_CATEGORY_OPENDRIVE = convert(Cint, 6)
const RDB_OBJECT_TYPE_NONE = convert(Cint, 0)
const RDB_OBJECT_TYPE_PLAYER_NONE = convert(Cint, 0)
const RDB_OBJECT_TYPE_PLAYER_CAR = convert(Cint, 1)
const RDB_OBJECT_TYPE_PLAYER_TRUCK = convert(Cint, 2)
const RDB_OBJECT_TYPE_PLAYER_VAN = convert(Cint, 3)
const RDB_OBJECT_TYPE_PLAYER_BIKE = convert(Cint, 4)
const RDB_OBJECT_TYPE_PLAYER_PEDESTRIAN = convert(Cint, 5)
const RDB_OBJECT_TYPE_PLAYER_PED_GROUP = convert(Cint, 6)
const RDB_OBJECT_TYPE_POLE = convert(Cint, 7)
const RDB_OBJECT_TYPE_TREE = convert(Cint, 8)
const RDB_OBJECT_TYPE_BARRIER = convert(Cint, 9)
const RDB_OBJECT_TYPE_OPT1 = convert(Cint, 10)
const RDB_OBJECT_TYPE_OPT2 = convert(Cint, 11)
const RDB_OBJECT_TYPE_OPT3 = convert(Cint, 12)
const RDB_OBJECT_TYPE_PLAYER_MOTORBIKE = convert(Cint, 13)
const RDB_OBJECT_TYPE_PLAYER_BUS = convert(Cint, 14)
const RDB_OBJECT_TYPE_STREET_LAMP = convert(Cint, 15)
const RDB_OBJECT_TYPE_TRAFFIC_SIGN = convert(Cint, 16)
const RDB_OBJECT_TYPE_HEADLIGHT = convert(Cint, 17)
const RDB_OBJECT_TYPE_PLAYER_TRAILER = convert(Cint, 18)
const RDB_OBJECT_TYPE_BUILDING = convert(Cint, 19)
const RDB_OBJECT_TYPE_PARKING_SPACE = convert(Cint, 20)
const RDB_OBJECT_TYPE_ROAD_WORKS = convert(Cint, 21)
const RDB_OBJECT_TYPE_ROAD_MISC = convert(Cint, 22)
const RDB_OBJECT_TYPE_TUNNEL = convert(Cint, 23)
const RDB_OBJECT_TYPE_LEGACY = convert(Cint, 24)
const RDB_OBJECT_TYPE_VEGETATION = convert(Cint, 25)
const RDB_OBJECT_TYPE_MISC_MOTORWAY = convert(Cint, 26)
const RDB_OBJECT_TYPE_MISC_TOWN = convert(Cint, 27)
const RDB_OBJECT_TYPE_PATCH = convert(Cint, 28)
const RDB_OBJECT_TYPE_OTHER = convert(Cint, 29)
const RDB_OBJECT_PLAYER_SEMI_TRAILER = convert(Cint, 30)
const RDB_OBJECT_PLAYER_RAILCAR = convert(Cint, 31)
const RDB_OBJECT_PLAYER_RAILCAR_SEMI_HEAD = convert(Cint, 32)
const RDB_OBJECT_PLAYER_RAILCAR_SEMI_BACK = convert(Cint, 33)
const RDB_LANE_BORDER_UNKNOWN = convert(Cint, 0)
const RDB_LANE_BORDER_NONE = convert(Cint, 1)
const RDB_LANE_BORDER_POLE = convert(Cint, 2)
const RDB_LANE_BORDER_BARRIER = convert(Cint, 3)
const RDB_LANE_BORDER_SOFT_SHOULDER = convert(Cint, 4)
const RDB_LANE_BORDER_HARD_SHOULDER = convert(Cint, 5)
const RDB_LANE_BORDER_CURB = convert(Cint, 6)
const RDB_ROADMARK_TYPE_NONE = convert(Cint, 0)
const RDB_ROADMARK_TYPE_SOLID = convert(Cint, 1)
const RDB_ROADMARK_TYPE_BROKEN = convert(Cint, 2)
const RDB_ROADMARK_TYPE_CURB = convert(Cint, 3)
const RDB_ROADMARK_TYPE_GRASS = convert(Cint, 4)
const RDB_ROADMARK_TYPE_BOTDOT = convert(Cint, 5)
const RDB_ROADMARK_TYPE_OTHER = convert(Cint, 6)
const RDB_ROADMARK_COLOR_NONE = convert(Cint, 0)
const RDB_ROADMARK_COLOR_WHITE = convert(Cint, 1)
const RDB_ROADMARK_COLOR_RED = convert(Cint, 2)
const RDB_ROADMARK_COLOR_YELLOW = convert(Cint, 3)
const RDB_ROADMARK_COLOR_OTHER = convert(Cint, 4)
const RDB_ROADMARK_COLOR_BLUE = convert(Cint, 5)
const RDB_ROADMARK_COLOR_GREEN = convert(Cint, 6)
const RDB_WHEEL_ID_FRONT_LEFT = convert(Cint, 0)
const RDB_GEAR_BOX_TYPE_AUTOMATIC = convert(Cint, 0)
const RDB_GEAR_BOX_TYPE_MANUAL = convert(Cint, 1)
const RDB_GEAR_BOX_POS_AUTO = convert(Cint, 0)
const RDB_GEAR_BOX_POS_P = convert(Cint, 1)
const RDB_GEAR_BOX_POS_R = convert(Cint, 2)
const RDB_GEAR_BOX_POS_N = convert(Cint, 3)
const RDB_GEAR_BOX_POS_D = convert(Cint, 4)
const RDB_GEAR_BOX_POS_1 = convert(Cint, 5)
const RDB_GEAR_BOX_POS_2 = convert(Cint, 6)
const RDB_GEAR_BOX_POS_3 = convert(Cint, 7)
const RDB_GEAR_BOX_POS_4 = convert(Cint, 8)
const RDB_GEAR_BOX_POS_5 = convert(Cint, 9)
const RDB_GEAR_BOX_POS_6 = convert(Cint, 10)
const RDB_GEAR_BOX_POS_7 = convert(Cint, 11)
const RDB_GEAR_BOX_POS_8 = convert(Cint, 12)
const RDB_GEAR_BOX_POS_9 = convert(Cint, 13)
const RDB_GEAR_BOX_POS_10 = convert(Cint, 14)
const RDB_GEAR_BOX_POS_11 = convert(Cint, 15)
const RDB_GEAR_BOX_POS_12 = convert(Cint, 16)
const RDB_GEAR_BOX_POS_13 = convert(Cint, 17)
const RDB_GEAR_BOX_POS_14 = convert(Cint, 18)
const RDB_GEAR_BOX_POS_15 = convert(Cint, 19)
const RDB_GEAR_BOX_POS_16 = convert(Cint, 20)
const RDB_GEAR_BOX_POS_R1 = convert(Cint, 21)
const RDB_GEAR_BOX_POS_R2 = convert(Cint, 22)
const RDB_GEAR_BOX_POS_R3 = convert(Cint, 23)
const RDB_GEAR_BOX_POS_M = convert(Cint, 24)
const RDB_GEAR_BOX_POS_M_UP = convert(Cint, 25)
const RDB_GEAR_BOX_POS_M_DOWN = convert(Cint, 26)
const RDB_DRIVETRAIN_TYPE_FRONT = convert(Cint, 0)
const RDB_DRIVETRAIN_TYPE_REAR = convert(Cint, 1)
const RDB_DRIVETRAIN_TYPE_AWD = convert(Cint, 2)
const RDB_PIX_FORMAT_RGB = convert(Cint, 0)
const RDB_PIX_FORMAT_RGB_16 = convert(Cint, 1)
const RDB_PIX_FORMAT_RGB_24 = convert(Cint, 2)
const RDB_PIX_FORMAT_RGBA = convert(Cint, 3)
const RDB_PIX_FORMAT_RGBA_16 = convert(Cint, 4)
const RDB_PIX_FORMAT_RGBA_24 = convert(Cint, 5)
const RDB_PIX_FORMAT_BW_8 = convert(Cint, 6)
const RDB_PIX_FORMAT_BW_16 = convert(Cint, 7)
const RDB_PIX_FORMAT_BW_24 = convert(Cint, 8)
const RDB_PIX_FORMAT_DEPTH_8 = convert(Cint, 9)
const RDB_PIX_FORMAT_DEPTH_16 = convert(Cint, 10)
const RDB_PIX_FORMAT_DEPTH_24 = convert(Cint, 11)
const RDB_PIX_FORMAT_RGB_32_F = convert(Cint, 12)
const RDB_PIX_FORMAT_RGBA_32_F = convert(Cint, 13)
const RDB_PIX_FORMAT_LUM_32_F = convert(Cint, 14)
const RDB_PIX_FORMAT_LUMA_32_F = convert(Cint, 15)
const RDB_PIX_FORMAT_RGB_16_F = convert(Cint, 16)
const RDB_PIX_FORMAT_RGBA_16_F = convert(Cint, 17)
const RDB_PIX_FORMAT_LUM_16_F = convert(Cint, 18)
const RDB_PIX_FORMAT_LUMA_16_F = convert(Cint, 19)
const RDB_PIX_FORMAT_DEPTH_32 = convert(Cint, 20)
const RDB_PIX_FORMAT_BW_32 = convert(Cint, 21)
const RDB_PIX_FORMAT_RGB_32 = convert(Cint, 22)
const RDB_PIX_FORMAT_RGBA_32 = convert(Cint, 23)
const RDB_PIX_FORMAT_R3_G2_B2 = convert(Cint, 24)
const RDB_PIX_FORMAT_R3_G2_B2_A8 = convert(Cint, 25)
const RDB_PIX_FORMAT_R5_G6_B5 = convert(Cint, 26)
const RDB_PIX_FORMAT_R5_G6_B5_A16 = convert(Cint, 27)
const RDB_PIX_FORMAT_RED8 = convert(Cint, 28)
const RDB_PIX_FORMAT_RED16 = convert(Cint, 29)
const RDB_PIX_FORMAT_RED16F = convert(Cint, 30)
const RDB_PIX_FORMAT_RED24 = convert(Cint, 31)
const RDB_PIX_FORMAT_RED32 = convert(Cint, 32)
const RDB_PIX_FORMAT_RED32F = convert(Cint, 33)
const RDB_PIX_FORMAT_RG8 = convert(Cint, 34)
const RDB_PIX_FORMAT_RG16 = convert(Cint, 35)
const RDB_PIX_FORMAT_RG16F = convert(Cint, 36)
const RDB_PIX_FORMAT_RG32 = convert(Cint, 37)
const RDB_PIX_FORMAT_RG32F = convert(Cint, 38)
const RDB_PIX_FORMAT_RGB8 = convert(Cint, 39)
const RDB_PIX_FORMAT_RGBA8 = convert(Cint, 40)
const RDB_PIX_FORMAT_RGB8_A24 = convert(Cint, 41)
const RDB_PIX_FORMAT_RGB16 = convert(Cint, 42)
const RDB_PIX_FORMAT_RGB16F = convert(Cint, 43)
const RDB_PIX_FORMAT_RGBA16 = convert(Cint, 44)
const RDB_PIX_FORMAT_RGBA16F = convert(Cint, 45)
const RDB_PIX_FORMAT_RGB32 = convert(Cint, 46)
const RDB_PIX_FORMAT_RGB32F = convert(Cint, 47)
const RDB_PIX_FORMAT_RGBA32 = convert(Cint, 48)
const RDB_PIX_FORMAT_RGBA32F = convert(Cint, 49)
const RDB_PIX_FORMAT_DEPTH8 = convert(Cint, 50)
const RDB_PIX_FORMAT_DEPTH16 = convert(Cint, 51)
const RDB_PIX_FORMAT_DEPTH24 = convert(Cint, 52)
const RDB_PIX_FORMAT_DEPTH32 = convert(Cint, 53)
const RDB_PIX_FORMAT_CUSTOM_01 = convert(Cint, 151)
const RDB_PIX_FORMAT_CUSTOM_02 = convert(Cint, 152)
const RDB_PIX_FORMAT_CUSTOM_03 = convert(Cint, 153)
const RDB_SENSOR_TYPE_NONE = convert(Cint, 0)
const RDB_SENSOR_TYPE_RADAR = convert(Cint, 1)
const RDB_SENSOR_TYPE_VIDEO = convert(Cint, 2)
const RDB_TRLIGHT_PHASE_OFF = convert(Cint, 0)
const RDB_TRLIGHT_PHASE_STOP = convert(Cint, 1)
const RDB_TRLIGHT_PHASE_STOP_ATTN = convert(Cint, 2)
const RDB_TRLIGHT_PHASE_GO = convert(Cint, 3)
const RDB_TRLIGHT_PHASE_GO_EXCL = convert(Cint, 4)
const RDB_TRLIGHT_PHASE_ATTN = convert(Cint, 5)
const RDB_TRLIGHT_PHASE_BLINK = convert(Cint, 6)
const RDB_TRLIGHT_PHASE_UNKNOWN = convert(Cint, 7)
const RDB_COORD_TYPE_INERTIAL = convert(Cint, 0)
const RDB_COORD_TYPE_RESERVED_1 = convert(Cint, 1)
const RDB_COORD_TYPE_PLAYER = convert(Cint, 2)
const RDB_COORD_TYPE_SENSOR = convert(Cint, 3)
const RDB_COORD_TYPE_USK = convert(Cint, 4)
const RDB_COORD_TYPE_USER = convert(Cint, 5)
const RDB_COORD_TYPE_WINDOW = convert(Cint, 6)
const RDB_COORD_TYPE_TEXTURE = convert(Cint, 7)
const RDB_COORD_TYPE_RELATIVE_START = convert(Cint, 8)
const RDB_COORD_TYPE_GEO = convert(Cint, 9)
const RDB_ENV_CLOUD_STATE_OFF = convert(Cint, 0)
const RDB_ENV_CLOUD_STATE_0_8 = convert(Cint, 1)
const RDB_ENV_CLOUD_STATE_4_8 = convert(Cint, 2)
const RDB_ENV_CLOUD_STATE_6_8 = convert(Cint, 3)
const RDB_ENV_CLOUD_STATE_8_8 = convert(Cint, 4)
const RDB_FUNCTION_TYPE_NONE = convert(Cint, 0)
const RDB_FUNCTION_TYPE_TONE_MAPPING = convert(Cint, 1)
const RDB_ROAD_TYPE_UNKNOWN = convert(Cint, 0)
const RDB_ROAD_TYPE_RURAL = convert(Cint, 1)
const RDB_ROAD_TYPE_MOTORWAY = convert(Cint, 2)
const RDB_ROAD_TYPE_TOWN = convert(Cint, 3)
const RDB_ROAD_TYPE_LOW_SPEED = convert(Cint, 4)
const RDB_ROAD_TYPE_PEDESTRIAN = convert(Cint, 5)
const RDB_DRIVER_SOURCE_UNKNOWN = convert(Cint, 0)
const RDB_DRIVER_SOURCE_GHOSTDRIVER = convert(Cint, 1)
const RDB_SHM_SIZE_TC = convert(Cint, 5242880)
const RDB_PKG_FLAG_NONE = @compat UInt16(0x0000)
const RDB_PKG_FLAG_EXTENDED = @compat UInt16(0x0001)
const RDB_PKG_FLAG_HIDDEN = @compat UInt16(0x0002)
const RDB_OBJECT_VIS_FLAG_ALL = convert(Cint, 0)
const RDB_OBJECT_VIS_FLAG_NONE = @compat UInt16(0x0000)
const RDB_OBJECT_VIS_FLAG_GFX = @compat UInt16(0x0001)
const RDB_OBJECT_VIS_FLAG_TRAFFIC = @compat UInt16(0x0002)
const RDB_OBJECT_VIS_FLAG_RECORDER = @compat UInt16(0x0004)
const RDB_VEHICLE_LIGHT_OFF = @compat UInt32(0x00000000)
const RDB_VEHICLE_LIGHT_PARK = @compat UInt32(0x00000001)
const RDB_VEHICLE_LIGHT_LOW_BEAM = @compat UInt32(0x00000002)
const RDB_VEHICLE_LIGHT_HIGH_BEAM = @compat UInt32(0x00000004)
const RDB_VEHICLE_LIGHT_REAR_BRAKE = @compat UInt32(0x00000008)
const RDB_VEHICLE_LIGHT_REAR_DRIVE = @compat UInt32(0x00000010)
const RDB_VEHICLE_LIGHT_INDICATOR_L = @compat UInt32(0x00000020)
const RDB_VEHICLE_LIGHT_INDICATOR_R = @compat UInt32(0x00000040)
const RDB_VEHICLE_LIGHT_FLASH = @compat UInt32(0x00000080)
const RDB_VEHICLE_LIGHT_FRONT_FOG = @compat UInt32(0x00000100)
const RDB_VEHICLE_LIGHT_REAR_FOG = @compat UInt32(0x00000200)
const RDB_VEHICLE_LIGHT_VIRES1 = @compat UInt32(0x00000400)
const RDB_VEHICLE_LIGHT_DRL = @compat UInt32(0x00000800)
const RDB_VEHICLE_LIGHT_DRL_LEFT_LOW = @compat UInt32(0x00001000)
const RDB_VEHICLE_LIGHT_DRL_RIGHT_LOW = @compat UInt32(0x00002000)
const RDB_VEHICLE_LIGHT_EMERGENCY = @compat UInt32(0x00004000)
const RDB_VEHICLE_LIGHT_INDICATOR_LAMP_ON = @compat UInt32(0x00008000)
const RDB_VEHICLE_ACC_FLAG_OFF = @compat UInt8(0x00)
const RDB_VEHICLE_ACC_FLAG_DIST_1 = @compat UInt8(0x01)
const RDB_VEHICLE_ACC_FLAG_DIST_2 = @compat UInt8(0x02)
const RDB_VEHICLE_ACC_FLAG_DIST_3 = @compat UInt8(0x03)
const RDB_VEHICLE_ACC_FLAG_TARGET = @compat UInt8(0x04)
const RDB_VEHICLE_ACC_FLAG_SPEED = @compat UInt8(0x08)
const RDB_VEHICLE_DISPLAY_LIGHT_OFF = @compat UInt16(0x0000)
const RDB_VEHICLE_DISPLAY_LIGHT_01 = @compat UInt16(0x0001)
const RDB_VEHICLE_DISPLAY_LIGHT_02 = @compat UInt16(0x0002)
const RDB_VEHICLE_DISPLAY_LIGHT_03 = @compat UInt16(0x0004)
const RDB_VEHICLE_DISPLAY_LIGHT_04 = @compat UInt16(0x0008)
const RDB_VEHICLE_DISPLAY_LIGHT_05 = @compat UInt16(0x0010)
const RDB_VEHICLE_DISPLAY_LIGHT_06 = @compat UInt16(0x0020)
const RDB_VEHICLE_DISPLAY_LIGHT_07 = @compat UInt16(0x0040)
const RDB_VEHICLE_DISPLAY_LIGHT_08 = @compat UInt16(0x0080)
const RDB_VEHICLE_DISPLAY_LIGHT_09 = @compat UInt16(0x0100)
const RDB_VEHICLE_DISPLAY_LIGHT_10 = @compat UInt16(0x0200)
const RDB_VEHICLE_DISPLAY_LIGHT_11 = @compat UInt16(0x0400)
const RDB_VEHICLE_DISPLAY_LIGHT_12 = @compat UInt16(0x0800)
const RDB_VEHICLE_DISPLAY_LIGHT_13 = @compat UInt16(0x1000)
const RDB_VEHICLE_DISPLAY_LIGHT_14 = @compat UInt16(0x2000)
const RDB_VEHICLE_DISPLAY_LIGHT_15 = @compat UInt16(0x4000)
const RDB_VEHICLE_DISPLAY_LIGHT_16 = @compat UInt16(0x8000)
const RDB_LANE_EXISTS_OWN = @compat UInt8(0x01)
const RDB_LANE_EXISTS_LEFT = @compat UInt8(0x02)
const RDB_LANE_EXISTS_RIGHT = @compat UInt8(0x04)
const RDB_LANE_STATUS_NONE = @compat UInt16(0x0000)
const RDB_LANE_STATUS_ROADWORKS = @compat UInt16(0x0001)
const RDB_LANE_STATUS_EXIT = @compat UInt16(0x0002)
const RDB_LANE_STATUS_ENTRY = @compat UInt16(0x0004)
const RDB_LANE_STATUS_LINKED = @compat UInt16(0x0008)
const RDB_LANE_STATUS_WET = @compat UInt16(0x0010)
const RDB_LANE_STATUS_SNOW = @compat UInt16(0x0020)
const RDB_DRIVER_FLAG_NONE = @compat UInt32(0x00000000)
const RDB_DRIVER_FLAG_INDICATOR_L = @compat UInt32(0x00000001)
const RDB_DRIVER_FLAG_INDICATOR_R = @compat UInt32(0x00000002)
const RDB_DRIVER_FLAG_PARKING_BRAKE = @compat UInt32(0x00000004)
const RDB_DRIVER_FLAG_LIGHT_LOW_BEAM = @compat UInt32(0x00000008)
const RDB_DRIVER_FLAG_LIGHT_HIGH_BEAM = @compat UInt32(0x00000010)
const RDB_DRIVER_FLAG_LIGHT_FOG_FRONT = @compat UInt32(0x00000020)
const RDB_DRIVER_FLAG_LIGHT_FOG_REAR = @compat UInt32(0x00000040)
const RDB_DRIVER_FLAG_LIGHT_EMERGENCY = @compat UInt32(0x00000080)
const RDB_DRIVER_FLAG_LIGHT_PRIORITY = @compat UInt32(0x00000100)
const RDB_MOCKUP_INPUT0_MFL_PLUS = @compat UInt32(0x00000001)
const RDB_MOCKUP_INPUT0_MFL_MINUS = @compat UInt32(0x00000002)
const RDB_MOCKUP_INPUT0_MFL_PHONE = @compat UInt32(0x00000004)
const RDB_MOCKUP_INPUT0_MFL_VOICE = @compat UInt32(0x00000008)
const RDB_MOCKUP_INPUT0_MFL_UP = @compat UInt32(0x00000010)
const RDB_MOCKUP_INPUT0_MFL_DOWN = @compat UInt32(0x00000020)
const RDB_MOCKUP_INPUT0_MFL_DIAMOND = @compat UInt32(0x00000040)
const RDB_MOCKUP_INPUT0_MFL_STAR = @compat UInt32(0x00000080)
const RDB_MOCKUP_INPUT0_TURN_UP = @compat UInt32(0x00000100)
const RDB_MOCKUP_INPUT0_TURN_UP_2 = @compat UInt32(0x00000200)
const RDB_MOCKUP_INPUT0_TURN_DOWN = @compat UInt32(0x00000400)
const RDB_MOCKUP_INPUT0_TURN_DOWN_2 = @compat UInt32(0x00000800)
const RDB_MOCKUP_INPUT0_TURN_FLASHER = @compat UInt32(0x00001000)
const RDB_MOCKUP_INPUT0_TURN_HIGHBEAM = @compat UInt32(0x00002000)
const RDB_MOCKUP_INPUT0_TURN_CHECK = @compat UInt32(0x00004000)
const RDB_MOCKUP_INPUT0_TURN_BC = @compat UInt32(0x00008000)
const RDB_MOCKUP_INPUT0_ACC_BACK = @compat UInt32(0x00010000)
const RDB_MOCKUP_INPUT0_ACC_BACK_2 = @compat UInt32(0x00020000)
const RDB_MOCKUP_INPUT0_ACC_FWD = @compat UInt32(0x00040000)
const RDB_MOCKUP_INPUT0_ACC_FWD_2 = @compat UInt32(0x00080000)
const RDB_MOCKUP_INPUT0_ACC_UP = @compat UInt32(0x00100000)
const RDB_MOCKUP_INPUT0_ACC_DOWN = @compat UInt32(0x00200000)
const RDB_MOCKUP_INPUT0_ACC_SET = @compat UInt32(0x00400000)
const RDB_MOCKUP_INPUT0_HORN = @compat UInt32(0x00800000)
const RDB_MOCKUP_INPUT0_WIPER_INTERVAL = @compat UInt32(0x03000000)
const RDB_MOCKUP_INPUT0_WIPER_INTERVAL_1 = @compat UInt32(0x01000000)
const RDB_MOCKUP_INPUT0_WIPER_INTERVAL_2 = @compat UInt32(0x02000000)
const RDB_MOCKUP_INPUT0_WIPER_INTERVAL_3 = @compat UInt32(0x03000000)
const RDB_MOCKUP_INPUT0_WIPER_AUTO = @compat UInt32(0x04000000)
const RDB_MOCKUP_INPUT0_WIPER_BACK = @compat UInt32(0x08000000)
const RDB_MOCKUP_INPUT0_WIPER_UP = @compat UInt32(0x10000000)
const RDB_MOCKUP_INPUT0_WIPER_UP_2 = @compat UInt32(0x20000000)
const RDB_MOCKUP_INPUT0_WIPER_DOWN = @compat UInt32(0x40000000)
const RDB_MOCKUP_INPUT1_ZBE_COUNTER = @compat UInt16(0x0000)
const RDB_MOCKUP_INPUT1_ZBE_FWD = @compat UInt32(0x00010000)
const RDB_MOCKUP_INPUT1_ZBE_BACK = @compat UInt32(0x00020000)
const RDB_MOCKUP_INPUT1_ZBE_LEFT = @compat UInt32(0x00040000)
const RDB_MOCKUP_INPUT1_ZBE_RIGHT = @compat UInt32(0x00080000)
const RDB_MOCKUP_INPUT1_ZBE_PRESS = @compat UInt32(0x00100000)
const RDB_MOCKUP_INPUT1_ZBE_MENU = @compat UInt32(0x00200000)
const RDB_MOCKUP_INPUT1_GWS_P = @compat UInt32(0x00400000)
const RDB_MOCKUP_INPUT1_GWS_LOCK = @compat UInt32(0x00800000)
const RDB_MOCKUP_INPUT1_GWS_FWD = @compat UInt32(0x01000000)
const RDB_MOCKUP_INPUT1_GWS_FWD_2 = @compat UInt32(0x02000000)
const RDB_MOCKUP_INPUT1_GWS_BACK = @compat UInt32(0x04000000)
const RDB_MOCKUP_INPUT1_GWS_BACK_2 = @compat UInt32(0x08000000)
const RDB_MOCKUP_INPUT1_GWS_AUTO_N = @compat UInt32(0x10000000)
const RDB_MOCKUP_INPUT1_GWS_MAN_N = @compat UInt32(0x20000000)
const RDB_MOCKUP_INPUT1_GWS_MAN_PLUS = @compat UInt32(0x40000000)
const RDB_MOCKUP_INPUT1_GWS_MAN_MINUS = @compat UInt32(0x80000000)
const RDB_MOCKUP_INPUT2_LSZ_POTI = @compat UInt32(0x000000)
const RDB_MOCKUP_INPUT2_LSZ_PARKING = @compat UInt32(0x00000100)
const RDB_MOCKUP_INPUT2_LSZ_DRIVING = @compat UInt32(0x00000200)
const RDB_MOCKUP_INPUT2_LSZ_AUTO = @compat UInt32(0x00000300)
const RDB_MOCKUP_INPUT2_LSZ_FOG_FRONT = @compat UInt32(0x00000400)
const RDB_MOCKUP_INPUT2_LSZ_FOG_REAR = @compat UInt32(0x00000800)
const RDB_MOCKUP_INPUT2_DB_DTC = @compat UInt32(0x00001000)
const RDB_MOCKUP_INPUT2_DB_PDC = @compat UInt32(0x00002000)
const RDB_MOCKUP_INPUT2_DB_SEAT_HEAT_L = @compat UInt32(0x00004000)
const RDB_MOCKUP_INPUT2_DB_SEAT_HEAT_R = @compat UInt32(0x00008000)
const RDB_MOCKUP_INPUT2_DB_STARTER = @compat UInt32(0x00010000)
const RDB_MOCKUP_INPUT2_DB_HAZARD_LIGHTS = @compat UInt32(0x00020000)
const RDB_MOCKUP_INPUT2_DB_LOCK = @compat UInt32(0x00040000)
const RDB_MOCKUP_INPUT2_DB_STEER_ADJUST_FWD = @compat UInt32(0x00100000)
const RDB_MOCKUP_INPUT2_DB_STEER_ADJUST_BACK = @compat UInt32(0x00200000)
const RDB_MOCKUP_INPUT2_DB_STEER_ADJUST_UP = @compat UInt32(0x00400000)
const RDB_MOCKUP_INPUT2_DB_STEER_ADJUST_DOWN = @compat UInt32(0x00800000)
const RDB_DRIVER_PERCEPTION_FLAG_NONE = @compat UInt32(0x00000000)
const RDB_DRIVER_PERCEPTION_FLAG_TURN_L = @compat UInt32(0x00000001)
const RDB_DRIVER_PERCEPTION_FLAG_TURN_R = @compat UInt32(0x00000002)
const RDB_DRIVER_INPUT_VALIDITY_NONE = @compat UInt32(0x00000000)
const RDB_DRIVER_INPUT_VALIDITY_STEERING_WHEEL = @compat UInt32(0x00000001)
const RDB_DRIVER_INPUT_VALIDITY_STEERING_SPEED = @compat UInt32(0x00000002)
const RDB_DRIVER_INPUT_VALIDITY_THROTTLE = @compat UInt32(0x00000004)
const RDB_DRIVER_INPUT_VALIDITY_BRAKE = @compat UInt32(0x00000008)
const RDB_DRIVER_INPUT_VALIDITY_CLUTCH = @compat UInt32(0x00000010)
const RDB_DRIVER_INPUT_VALIDITY_TGT_ACCEL = @compat UInt32(0x00000020)
const RDB_DRIVER_INPUT_VALIDITY_TGT_STEERING = @compat UInt32(0x00000040)
const RDB_DRIVER_INPUT_VALIDITY_GEAR = @compat UInt32(0x00000080)
const RDB_DRIVER_INPUT_VALIDITY_CURVATURE = @compat UInt32(0x00000100)
const RDB_DRIVER_INPUT_VALIDITY_STEERING_TORQUE = @compat UInt32(0x00000200)
const RDB_DRIVER_INPUT_VALIDITY_ENGINE_TORQUE = @compat UInt32(0x00000400)
const RDB_DRIVER_INPUT_VALIDITY_TGT_SPEED = @compat UInt32(0x00000800)
const RDB_DRIVER_INPUT_VALIDITY_INFO_ONLY = @compat UInt32(0x00001000)
const RDB_DRIVER_INPUT_VALIDITY_ADD_ON = @compat UInt32(0x00002000)
const RDB_DRIVER_INPUT_VALIDITY_FLAGS = @compat UInt32(0x00004000)
const RDB_DRIVER_INPUT_VALIDITY_MOCKUP_INPUT0 = @compat UInt32(0x00008000)
const RDB_DRIVER_INPUT_VALIDITY_MOCKUP_INPUT1 = @compat UInt32(0x00010000)
const RDB_DRIVER_INPUT_VALIDITY_MOCKUP_INPUT2 = @compat UInt32(0x00020000)
const RDB_SCORING_FLAG_NONE = @compat UInt32(0x00000000)
const RDB_SCORING_FLAG_COLLISION = @compat UInt32(0x00000001)
const RDB_SCORING_FLAG_OFF_ROAD = @compat UInt32(0x00000002)
const RDB_COORD_FLAG_NONE = @compat UInt8(0x00)
const RDB_COORD_FLAG_POINT_VALID = @compat UInt8(0x01)
const RDB_COORD_FLAG_ANGLES_VALID = @compat UInt8(0x02)
const RDB_LIGHT_SOURCE_FLAG_NONE = @compat UInt16(0x0000)
const RDB_LIGHT_SOURCE_FLAG_USE_FRUSTUM = @compat UInt16(0x0001)
const RDB_LIGHT_SOURCE_FLAG_PERSISTENT = @compat UInt16(0x0002)
const RDB_LIGHT_SOURCE_FLAG_STENCIL = @compat UInt16(0x0004)
const RDB_SENSOR_OBJECT_FLAG_NONE = @compat UInt16(0x0000)
const RDB_SENSOR_OBJECT_FLAG_CRITICALITY_LOW = @compat UInt16(0x0001)
const RDB_SENSOR_OBJECT_FLAG_CRITICALITY_MEDIUM = @compat UInt16(0x0002)
const RDB_SENSOR_OBJECT_FLAG_CRITICALITY_HIGH = @compat UInt16(0x0003)
const RDB_ROAD_EVENT_NONE = @compat UInt32(0x00000000)
const RDB_ROAD_EVENT_POTHOLE = @compat UInt32(0x00000001)
const RDB_ENV_FLAG_NONE = @compat UInt16(0x0000)
const RDB_ENV_FLAG_PRECIPITATION_SNOW = @compat UInt16(0x0001)
const RDB_ENV_FLAG_PRECIPITATION_HAIL = @compat UInt16(0x0002)
const RDB_ENV_FLAG_ROAD_SURFACE_WET = @compat UInt16(0x0004)
const RDB_ENV_FLAG_STREET_LAMPS = @compat UInt16(0x0008)
const RDB_SHM_ID_IMG_GENERATOR_OUT = @compat UInt16(0x0816)
const RDB_SHM_ID_IMG_GENERATOR_IN = @compat UInt16(0x0817)
const RDB_SHM_ID_CONTROL_GENERATOR_IN = @compat UInt16(0x0817)
const RDB_SHM_ID_CUSTOM_01 = @compat UInt16(0x0818)
const RDB_SHM_ID_TC_IN = @compat UInt16(0x08200)
const RDB_SHM_ID_TC_OUT = @compat UInt16(0x08201)
const RDB_SHM_ID_DYN_2_STEER = @compat UInt16(0x08210)
const RDB_SHM_ID_STEER_2_DYN = @compat UInt16(0x08211)
const RDB_SHM_BUFFER_FLAG_NONE = @compat UInt32(0x00000000)
const RDB_SHM_BUFFER_FLAG_LOCK = @compat UInt32(0x00000001)
const RDB_SHM_BUFFER_FLAG_TC = @compat UInt32(0x00000002)
const RDB_SHM_BUFFER_FLAG_IG = @compat UInt32(0x00000004)
const RDB_OBJECT_CFG_FLAG_NONE = @compat UInt16(0x0000)
const RDB_OBJECT_CFG_FLAG_CTRL_EXTERN = @compat UInt16(0x0001)
const RDB_ROAD_POS_FLAG_NONE = @compat UInt8(0x00)
const RDB_ROAD_POS_FLAG_DIR_FWD = @compat UInt8(0x01)
const RDB_ROAD_POS_FLAG_DIR_REAR = @compat UInt8(0x02)
const RDB_CONTACT_POINT_FLAG_NONE = @compat UInt16(0x0000)
const RDB_CONTACT_POINT_FLAG_PLAYER_VALID = @compat UInt16(0x0001)
const RDB_SYNC_CMD_RENDER_CONTINUOUS = @compat UInt32(0x00000080)
const RDB_SYNC_CMD_RENDER_PAUSE = @compat UInt32(0x00000100)
const RDB_SYNC_CMD_RENDER_SINGLE_FRAME = @compat UInt32(0x00000200)
const RDB_TRAJECTORY_FLAG_NONE = @compat UInt16(0x0000)
const RDB_TRAJECTORY_FLAG_TIME_DOMAIN = @compat UInt16(0x0001)
const RDB_DYN_2_STEER_STATE_NONE = @compat UInt16(0x0000)
const RDB_DYN_2_STEER_STATE_PAUSE = @compat UInt16(0x0001)
const RDB_DYN_2_STEER_STATE_RUN = @compat UInt16(0x0002)
const RDB_DYN_2_STEER_STATE_ERROR = @compat UInt16(0x0004)
const RDB_DYN_2_STEER_CMD_NONE = @compat UInt16(0x0000)
const RDB_DYN_2_STEER_CMD_RESET = @compat UInt16(0x0001)
const RDB_DYN_2_STEER_EFFECT_NONE = @compat UInt32(0x00000000)
const RDB_DYN_2_STEER_EFFECT_TIRE_MODEL = @compat UInt32(0x00000001)
const RDB_DYN_2_STEER_EFFECT_VIBRATION_10HZ = @compat UInt32(0x00000002)
const RDB_STEER_2_DYN_STATE_OFF = @compat UInt32(0x00000000)
const RDB_STEER_2_DYN_STATE_INIT = @compat UInt32(0x00000001)
const RDB_STEER_2_DYN_STATE_FAIL = @compat UInt32(0x00000002)
const RDB_STEER_2_DYN_STATE_RUN = @compat UInt32(0x00000004)
const RDB_STEER_2_DYN_STATE_OVER_LIMITS = @compat UInt32(0x00000008)
const RDB_WHEEL_FLAG_NONE = @compat UInt16(0x0000)
const RDB_WHEEL_FLAG_ON_ROADMARK = @compat UInt16(0x0001)
const RDB_MOTION_SYSTEM_FLAG_NONE = @compat UInt16(0x0000)
const RDB_MOTION_SYSTEM_FLAG_ACTIVE = @compat UInt16(0x0001)
const RDB_MOTION_SYSTEM_FLAG_ERROR = @compat UInt16(0x0002)
type RDB_POINT_t
    x::Cdouble
    y::Cdouble
    z::Cdouble
    flags::Uint8
    thetype::Uint8
    system::Uint16
end

type RDB_COORD_t
    x::Cdouble
    y::Cdouble
    z::Cdouble
    h::Cfloat
    p::Cfloat
    r::Cfloat
    flags::Uint8
    thetype::Uint8
    system::Uint16
end

type RDB_COORD_SYSTEM_t
    id::Uint16
    spare::Uint16
    pos::RDB_COORD_t
end

type RDB_ROAD_POS_t
    playerId::Uint32
    roadId::Uint16
    laneId::Int8
    flags::Uint8
    roadS::Cfloat
    roadT::Cfloat
    laneOffset::Cfloat
    hdgRel::Cfloat
    pitchRel::Cfloat
    rollRel::Cfloat
    roadType::Uint8
    spare1::Uint8
    spare2::Uint16
    pathS::Cfloat
end

type RDB_ROADMARK_t
    playerId::Uint32
    id::Int8
    prevId::Int8
    nextId::Int8
    spare0::Uint8
    lateralDist::Cfloat
    yawRel::Cfloat
    curvHor::Cdouble
    curvHorDot::Cdouble
    startDx::Cfloat
    previewDx::Cfloat
    width::Cfloat
    height::Cfloat
    curvVert::Cdouble
    curvVertDot::Cdouble
    thetype::Uint8
    color::Uint8
    noDataPoints::Uint16
    spare1::(Uint32, Uint32)
end

type RDB_LANE_INFO_t
    roadId::Uint16
    id::Int8
    neighborMask::Uint8
    leftLaneId::Int8
    rightLaneId::Int8
    borderType::Uint8
    material::Uint8
    status::Uint16
    thetype::Uint16
    width::Cfloat
    curvVert::Cdouble
    curvVertDot::Cdouble
    curvHor::Cdouble
    curvHorDot::Cdouble
    playerId::Uint32
    spare1::Uint32
end

type RDB_OBJECT_CFG_t
    id::Uint32
    category::Uint8
    thetype::Uint8
    modelId::Int16
    flags::Uint16
    spare0::Uint16
    spare1::Uint32
end

type RDB_GEOMETRY_t
    dimX::Cfloat
    dimY::Cfloat
    dimZ::Cfloat
    offX::Cfloat
    offY::Cfloat
    offZ::Cfloat
end

type RDB_OBJECT_STATE_BASE_t
    id::Uint32
    category::Uint8
    thetype::Uint8
    visMask::Uint16
    geo::RDB_GEOMETRY_t
    pos::RDB_COORD_t
    parent::Uint32
    spare1::Uint32
end

type RDB_OBJECT_STATE_EXT_t
    speed::RDB_COORD_t
    accel::RDB_COORD_t
    spare::(Uint32, Uint32, Uint32, Uint32)
end

type RDB_OBJECT_STATE_t
    base::RDB_OBJECT_STATE_BASE_t
    ext::RDB_OBJECT_STATE_EXT_t
end

type RDB_ENGINE_BASE_t
    playerId::Uint32
    rps::Cfloat
    load::Cfloat
    spare1::(Uint32, Uint32)
end

type RDB_ENGINE_EXT_t
    rpsStart::Cfloat
    torque::Cfloat
    torqueInner::Cfloat
    torqueMax::Cfloat
    torqueFriction::Cfloat
    fuelCurrent::Cfloat
    fuelAverage::Cfloat
    spare::(Uint32, Uint32)
end

type RDB_ENGINE_t
    base::RDB_ENGINE_BASE_t
    ext::RDB_ENGINE_EXT_t
end

type RDB_DRIVETRAIN_BASE_t
    playerId::Uint32
    gearBoxType::Uint8
    driveTrainType::Uint8
    gear::Uint8
    spare0::Uint8
    spare1::(Uint32, Uint32)
end

type RDB_DRIVETRAIN_EXT_t
    torqueGearBoxIn::Cfloat
    torqueCenterDiffOut::Cfloat
    torqueShaft::Cfloat
    spare1::(Uint32, Uint32)
end

type RDB_DRIVETRAIN_t
    base::RDB_DRIVETRAIN_BASE_t
    ext::RDB_DRIVETRAIN_EXT_t
end

type RDB_WHEEL_BASE_t
    playerId::Uint32
    id::Uint8
    flags::Uint8
    spare0::(Uint8, Uint8)
    radiusStatic::Cfloat
    springCompression::Cfloat
    rotAngle::Cfloat
    slip::Cfloat
    steeringAngle::Cfloat
    spare1::(Uint32, Uint32, Uint32, Uint32)
end

type RDB_WHEEL_EXT_t
    vAngular::Cfloat
    forceZ::Cfloat
    forceLat::Cfloat
    forceLong::Cfloat
    forceTireWheelXYZ::(Cfloat, Cfloat, Cfloat)
    radiusDynamic::Cfloat
    brakePressure::Cfloat
    torqueDriveShaft::Cfloat
    damperSpeed::Cfloat
    spare2::(Uint32, Uint32, Uint32, Uint32)
end

type RDB_WHEEL_t
    base::RDB_WHEEL_BASE_t
    ext::RDB_WHEEL_EXT_t
end

type RDB_VEHICLE_SYSTEMS_t
    playerId::Uint32
    lightMask::Uint32
    steering::Cfloat
    steeringWheelTorque::Cfloat
    accMask::Uint8
    accSpeed::Uint8
    batteryState::Uint8
    batteryRate::Int8
    displayLightMask::Uint16
    spare0::Uint16
    spare::(Uint32, Uint32, Uint32, Uint32, Uint32)
end

type RDB_VEHICLE_SETUP_t
    playerId::Uint32
    mass::Cfloat
    wheelBase::Cfloat
    spare::(Int32, Int32, Int32, Int32)
end

type RDB_IMAGE_t
    id::Uint32
    width::Uint16
    height::Uint16
    pixelSize::Uint8
    pixelFormat::Uint8
    cameraId::Uint16
    imgSize::Uint32
    color::(Uint8, Uint8, Uint8, Uint8)
    spare1::(Uint32, Uint32, Uint32)
end

type RDB_FUNCTION_t
    id::Uint32
    thetype::Uint8
    dimension::Uint8
    spare::Uint16
    dataSize::Uint32
    spare1::(Uint32, Uint32, Uint32, Uint32)
end

type RDB_SENSOR_STATE_t
    id::Uint32
    thetype::Uint8
    hostCategory::Uint8
    spare0::Uint16
    hostId::Uint32
    fovHV::(Cfloat, Cfloat)
    clipNF::(Cfloat, Cfloat)
    pos::RDB_COORD_t
    originCoordSys::RDB_COORD_t
    spare::(Int32, Int32, Int32, Int32)
end

type RDB_SENSOR_OBJECT_t
    category::Uint8
    thetype::Uint8
    flags::Uint16
    id::Uint32
    sensorId::Uint32
    dist::Cdouble
    sensorPos::RDB_COORD_t
    occlusion::Int8
    spare0::(Uint8, Uint8, Uint8)
    spare::(Uint32, Uint32, Uint32)
end

type RDB_CAMERA_t
    id::Uint16
    width::Uint16
    height::Uint16
    spare0::Uint16
    clipNear::Cfloat
    clipFar::Cfloat
    focalX::Cfloat
    focalY::Cfloat
    principalX::Cfloat
    principalY::Cfloat
    pos::RDB_COORD_t
    spare1::(Uint32, Uint32, Uint32, Uint32)
end

type RDB_LIGHT_SOURCE_BASE_t
    id::Uint16
    templateId::Int8
    state::Uint8
    playerId::Int32
    pos::RDB_COORD_t
    flags::Uint16
    spare0::Uint16
    spare1::(Int32, Int32)
end

type RDB_LIGHT_SOURCE_EXT_t
    nearFar::(Cfloat, Cfloat)
    frustumLRBT::(Cfloat, Cfloat, Cfloat, Cfloat)
    intensity::(Cfloat, Cfloat, Cfloat)
    atten::(Cfloat, Cfloat, Cfloat)
    spare1::(Int32, Int32, Int32)
end

type RDB_LIGHT_SOURCE_t
    base::RDB_LIGHT_SOURCE_BASE_t
    ext::RDB_LIGHT_SOURCE_EXT_t
end

type RDB_CONTACT_POINT_t
    id::Uint16
    flags::Uint16
    roadDataIn::RDB_COORD_t
    friction::Cfloat
    playerId::Int32
    spare1::Int32
end

type RDB_TRAFFIC_SIGN_t
    id::Uint32
    playerId::Uint32
    roadDist::Cfloat
    pos::RDB_COORD_t
    thetype::Int32
    subType::Int32
    value::Cfloat
    state::Uint32
    readability::Int8
    occlusion::Int8
    spare0::Uint16
    addOnId::Uint32
    minLane::Int8
    maxLane::Int8
    spare::Uint16
end

type RDB_ROAD_STATE_t
    playerId::Uint32
    wheelId::Int8
    spare0::Uint8
    spare1::Uint16
    roadId::Uint32
    defaultSpeed::Cfloat
    waterLevel::Cfloat
    eventMask::Uint32
    spare2::(Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32)
end

type RDB_ENVIRONMENT_t
    visibility::Cfloat
    timeOfDay::Uint32
    brightness::Cfloat
    precipitation::Uint8
    cloudState::Uint8
    flags::Uint16
    spare1::(Uint32, Uint32, Uint32, Uint32, Uint32, Uint32, Uint32, Uint32)
end

type RDB_PED_ANIMATION_t
    playerId::Uint32
    pos::RDB_COORD_t
    spare::(Uint32, Uint32, Uint32, Uint32)
    noCoords::Uint32
    dataSize::Uint32
end

type RDB_CUSTOM_SCORING_t
    playerId::Uint32
    pathS::Cfloat
    roadS::Cfloat
    fuelCurrent::Cfloat
    fuelAverage::Cfloat
    stateFlags::Uint32
    slip::Cfloat
    spare::(Uint32, Uint32, Uint32, Uint32)
end

type RDB_TRIGGER_t
    deltaT::Cfloat
    frameNo::Uint32
    spare::Int32
end

type RDB_DRIVER_CTRL_t
    playerId::Uint32
    steeringWheel::Cfloat
    steeringSpeed::Cfloat
    throttlePedal::Cfloat
    brakePedal::Cfloat
    clutchPedal::Cfloat
    accelTgt::Cfloat
    steeringTgt::Cfloat
    curvatureTgt::Cdouble
    steeringTorque::Cfloat
    engineTorqueTgt::Cfloat
    speedTgt::Cfloat
    gear::Uint8
    sourceId::Uint8
    spare0::(Uint8, Uint8)
    validityFlags::Uint32
    flags::Uint32
    mockupInput0::Uint32
    mockupInput1::Uint32
    mockupInput2::Uint32
    spare::Uint32
end

type RDB_DRIVER_PERCEPTION_t
    playerId::Uint32
    speedFromRules::Cfloat
    distToSpeed::Cfloat
    spare0::(Cfloat, Cfloat, Cfloat, Cfloat)
    flags::Uint32
    spare::(Uint32, Uint32, Uint32, Uint32)
end

type RDB_TRAFFIC_LIGHT_BASE_t
    id::Int32
    state::Cfloat
    stateMask::Uint32
end

type RDB_TRAFFIC_LIGHT_PHASE_t
    duration::Cfloat
    thetype::Uint8
    spare::(Uint8, Uint8, Uint8)
end

type RDB_TRAFFIC_LIGHT_EXT_t
    ctrlId::Int32
    cycleTime::Cfloat
    noPhases::Uint16
    dataSize::Uint32
end

type RDB_TRAFFIC_LIGHT_t
    base::RDB_TRAFFIC_LIGHT_BASE_t
    ext::RDB_TRAFFIC_LIGHT_EXT_t
end

type RDB_SYNC_t
    mask::Uint32
    cmdMask::Uint32
    systemTime::Cdouble
end

type RDB_ROAD_QUERY_t
    id::Uint16
    flags::Uint16
    spare::(Uint16, Uint16)
    x::Cdouble
    y::Cdouble
end

type RDB_SCP_t
    version::Uint16
    spare::Uint16
    dataSize::Uint32
end

type RDB_PROXY_t
    protocol::Uint16
    pkgId::Uint16
    spare::(Uint32, Uint32, Uint32, Uint32, Uint32, Uint32)
    dataSize::Uint32
end

type RDB_TRAJECTORY_t
    playerId::Uint32
    spacing::Cdouble
    flags::Uint16
    noDataPoints::Uint16
    spare::(Uint32, Uint32, Uint32, Uint32)
end

type RDB_MOTION_SYSTEM_t
    playerId::Uint32
    flags::Uint32
    pos::RDB_COORD_t
    speed::RDB_COORD_t
    spare::(Uint32, Uint32, Uint32, Uint32, Uint32, Uint32)
end

type RDB_END_OF_FRAME_t
end

type RDB_START_OF_FRAME_t
end

type RDB_STEER_2_DYN_t
    playerId::Uint32
    state::Uint32
    angle::Cfloat
    rev::Cfloat
    torque::Cfloat
    spare::(Uint32, Uint32, Uint32, Uint32, Uint32, Uint32, Uint32, Uint32)
end

type RDB_DYN_2_STEER_t
    playerId::Uint32
    state::Uint16
    cmd::Uint16
    effects::Uint32
    torque::Cfloat
    friction::Cfloat
    damping::Cfloat
    stiffness::Cfloat
    velocity::Cfloat
    angle::Cfloat
    spare::(Uint32, Uint32, Uint32, Uint32, Uint32, Uint32, Uint32, Uint32)
end

type RDB_MSG_HDR_t
    magicNo::Uint16
    version::Uint16
    headerSize::Uint32
    dataSize::Uint32
    frameNo::Uint32
    simTime::Cdouble
end

type RDB_MSG_ENTRY_HDR_t
    headerSize::Uint32
    dataSize::Uint32
    elementSize::Uint32
    pkgId::Uint16
    flags::Uint16
end

# type RDB_MSG_t
#     hdr::RDB_MSG_HDR_t
#     entryHdr::RDB_MSG_ENTRY_HDR_t
#     u::RDB_MSG_UNION_t
# end

type RDB_SHM_BUFFER_INFO_t
    thisSize::Uint32
    bufferSize::Uint32
    id::Uint16
    spare0::Uint16
    flags::Uint32
    offset::Uint32
    spare1::(Uint32, Uint32, Uint32, Uint32)
end

type RDB_SHM_HDR_t
    headerSize::Uint32
    dataSize::Uint32
    noBuffers::Uint8
end

############

function rdb_pkg_id_to_string(id::Integer)
    if id == RDB_PKG_ID_START_OF_FRAME    
        "START_OF_FRAME"
    elseif id == RDB_PKG_ID_END_OF_FRAME      
        "END_OF_FRAME"
    elseif id == RDB_PKG_ID_COORD_SYSTEM      
        "COORD_SYSTEM"
    elseif id == RDB_PKG_ID_COORD             
        "COORD"
    elseif id == RDB_PKG_ID_ROAD_POS          
        "ROAD_POS"
    elseif id == RDB_PKG_ID_LANE_INFO         
        "LANE_INFO"
    elseif id == RDB_PKG_ID_ROADMARK          
        "ROADMARK"
    elseif id == RDB_PKG_ID_OBJECT_CFG        
        "OBJECT_CFG"
    elseif id == RDB_PKG_ID_OBJECT_STATE      
        "OBJECT_STATE"
    elseif id == RDB_PKG_ID_VEHICLE_SYSTEMS   
        "VEHICLE_SYSTEMS"
    elseif id == RDB_PKG_ID_VEHICLE_SETUP     
        "VEHICLE_SETUP"
    elseif id == RDB_PKG_ID_ENGINE            
        "ENGINE"
    elseif id == RDB_PKG_ID_DRIVETRAIN        
        "DRIVETRAIN"
    elseif id == RDB_PKG_ID_WHEEL             
        "WHEEL"
    elseif id == RDB_PKG_ID_PED_ANIMATION     
        "PED_ANIMATION"
    elseif id == RDB_PKG_ID_SENSOR_STATE      
        "SENSOR_STATE"
    elseif id == RDB_PKG_ID_SENSOR_OBJECT     
        "SENSOR_OBJECT"
    elseif id == RDB_PKG_ID_CAMERA            
        "CAMERA"
    elseif id == RDB_PKG_ID_CONTACT_POINT     
        "CONTACT_POINT"
    elseif id == RDB_PKG_ID_TRAFFIC_SIGN      
        "TRAFFIC_SIGN"
    elseif id == RDB_PKG_ID_ROAD_STATE        
        "ROAD_STATE"
    elseif id == RDB_PKG_ID_IMAGE             
        "IMAGE"
    elseif id == RDB_PKG_ID_LIGHT_SOURCE      
        "LIGHT_SOURCE"
    elseif id == RDB_PKG_ID_ENVIRONMENT       
        "ENVIRONMENT"
    elseif id == RDB_PKG_ID_TRIGGER           
        "TRIGGER"
    elseif id == RDB_PKG_ID_DRIVER_CTRL       
        "DRIVER_CTRL"
    elseif id == RDB_PKG_ID_TRAFFIC_LIGHT     
        "TRAFFIC_LIGHT"
    elseif id == RDB_PKG_ID_SYNC              
        "SYNC"
    elseif id == RDB_PKG_ID_DRIVER_PERCEPTION 
        "DRIVER_PERCEPTION"
    elseif id == RDB_PKG_ID_LIGHT_MAP         
        "LIGHT_MAP"
    elseif id == RDB_PKG_ID_TONE_MAPPING      
        "TONE_MAPPING"
    elseif id == RDB_PKG_ID_ROAD_QUERY        
        "ROAD_QUERY"
    elseif id == RDB_PKG_ID_SCP               
        "SCP"
    elseif id == RDB_PKG_ID_TRAJECTORY        
        "TRAJECTORY"
    elseif id == RDB_PKG_ID_DYN_2_STEER       
        "DYN_2_STEER"
    elseif id == RDB_PKG_ID_STEER_2_DYN       
        "STEER_2_DYN"
    elseif id == RDB_PKG_ID_PROXY             
        "PROXY"
    elseif id == RDB_PKG_ID_MOTION_SYSTEM     
        "MOTION_SYSTEM"
    elseif id == RDB_PKG_ID_OCCLUSION_MATRIX  
        "OCCLUSION_MATRIX"
    elseif id == RDB_PKG_ID_CUSTOM_SCORING
        "RDB_PKG_ID_CUSTOM_SCORING"     
    elseif id == RDB_PKG_ID_CUSTOM_AUDI_FORUM
        "RDB_PKG_ID_CUSTOM_AUDI_FORUM"  
    elseif id == RDB_PKG_ID_CUSTOM_OPTIX_START
        "RDB_PKG_ID_CUSTOM_OPTIX_START" 
    elseif id == RDB_PKG_ID_OPTIX_BUFFER
        "RDB_PKG_ID_OPTIX_BUFFER"       
    elseif id == RDB_PKG_ID_CUSTOM_OPTIX_END
        "RDB_PKG_ID_CUSTOM_OPTIX_END"   
    elseif id == RDB_PKG_ID_CUSTOM_USER_A_START
        "RDB_PKG_ID_CUSTOM_USER_A_START"
    elseif id == RDB_PKG_ID_CUSTOM_USER_A_END
        "RDB_PKG_ID_CUSTOM_USER_A_END"  
    else
        warn("unknown RDB package id $id")
        "UNKNOWN"
    end
end



