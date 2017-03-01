# NOTE(tim): these definitions were automatically extracted from viRDBIcd.h
#            using VirtualTestDrive/dev/extract_defines.jl

const RDB_DEFAULT_PORT = convert(Cint, 48190)
const RDB_FEEDBACK_PORT = convert(Cint, 48191)
const RDB_IMAGE_PORT = convert(Cint, 48192)
const RDB_MAGIC_NO = @compat UInt16(35712)
const RDB_VERSION = @compat UInt16(0x0118)
const RDB_SIZE_OBJECT_NAME = convert(Cint, 32)
const RDB_SIZE_SCP_NAME = convert(Cint, 64)
const RDB_SIZE_FILENAME = convert(Cint, 1024)
const RDB_SIZE_TRLIGHT_PHASES = convert(Cint, 8)

const RDB_PKG_ID_START_OF_FRAME = convert(UInt16, 1)
const RDB_PKG_ID_END_OF_FRAME = convert(UInt16, 2)
const RDB_PKG_ID_COORD_SYSTEM = convert(UInt16, 3)
const RDB_PKG_ID_COORD = convert(UInt16, 4)
const RDB_PKG_ID_ROAD_POS = convert(UInt16, 5)
const RDB_PKG_ID_LANE_INFO = convert(UInt16, 6)
const RDB_PKG_ID_ROADMARK = convert(UInt16, 7)
const RDB_PKG_ID_OBJECT_CFG = convert(UInt16, 8)
const RDB_PKG_ID_OBJECT_STATE = convert(UInt16, 9)
const RDB_PKG_ID_VEHICLE_SYSTEMS = convert(UInt16, 10)
const RDB_PKG_ID_VEHICLE_SETUP = convert(UInt16, 11)
const RDB_PKG_ID_ENGINE = convert(UInt16, 12)
const RDB_PKG_ID_DRIVETRAIN = convert(UInt16, 13)
const RDB_PKG_ID_WHEEL = convert(UInt16, 14)
const RDB_PKG_ID_PED_ANIMATION = convert(UInt16, 15)
const RDB_PKG_ID_SENSOR_STATE = convert(UInt16, 16)
const RDB_PKG_ID_SENSOR_OBJECT = convert(UInt16, 17)
const RDB_PKG_ID_CAMERA = convert(UInt16, 18)
const RDB_PKG_ID_CONTACT_POINT = convert(UInt16, 19)
const RDB_PKG_ID_TRAFFIC_SIGN = convert(UInt16, 20)
const RDB_PKG_ID_ROAD_STATE = convert(UInt16, 21)
const RDB_PKG_ID_IMAGE = convert(UInt16, 22)
const RDB_PKG_ID_LIGHT_SOURCE = convert(UInt16, 23)
const RDB_PKG_ID_ENVIRONMENT = convert(UInt16, 24)
const RDB_PKG_ID_TRIGGER = convert(UInt16, 25)
const RDB_PKG_ID_DRIVER_CTRL = convert(UInt16, 26)
const RDB_PKG_ID_TRAFFIC_LIGHT = convert(UInt16, 27)
const RDB_PKG_ID_SYNC = convert(UInt16, 28)
const RDB_PKG_ID_DRIVER_PERCEPTION = convert(UInt16, 29)
const RDB_PKG_ID_LIGHT_MAP = convert(UInt16, 30)
const RDB_PKG_ID_TONE_MAPPING = convert(UInt16, 31)
const RDB_PKG_ID_ROAD_QUERY = convert(UInt16, 32)
const RDB_PKG_ID_SCP = convert(UInt16, 33)
const RDB_PKG_ID_TRAJECTORY = convert(UInt16, 34)
const RDB_PKG_ID_DYN_2_STEER = convert(UInt16, 35)
const RDB_PKG_ID_STEER_2_DYN = convert(UInt16, 36)
const RDB_PKG_ID_PROXY = convert(UInt16, 37)
const RDB_PKG_ID_MOTION_SYSTEM = convert(UInt16, 38)
const RDB_PKG_ID_OCCLUSION_MATRIX = convert(UInt16, 39)
const RDB_PKG_ID_CUSTOM_SCORING = convert(UInt16, 10000)
const RDB_PKG_ID_CUSTOM_AUDI_FORUM = convert(UInt16, 12000)
const RDB_PKG_ID_CUSTOM_OPTIX_START = convert(UInt16, 12100)
const RDB_PKG_ID_OPTIX_BUFFER = convert(UInt16, 12101)
const RDB_PKG_ID_CUSTOM_OPTIX_END = convert(UInt16, 12149)
const RDB_PKG_ID_CUSTOM_USER_A_START = convert(UInt16, 12150)
const RDB_PKG_ID_CUSTOM_USER_A_END = convert(UInt16, 12174)

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

abstract RDB_PACKAGE_ELEMENT

type RDB_POINT_t <: RDB_PACKAGE_ELEMENT
    x::Cdouble
    y::Cdouble
    z::Cdouble
    flags::UInt8
    thetype::UInt8
    system::UInt16
end

type RDB_COORD_t <: RDB_PACKAGE_ELEMENT
    x::Cdouble
    y::Cdouble
    z::Cdouble
    h::Cfloat
    p::Cfloat
    r::Cfloat
    flags::UInt8
    thetype::UInt8
    system::UInt16
end

type RDB_COORD_SYSTEM_t <: RDB_PACKAGE_ELEMENT
    id::UInt16
    spare::UInt16
    pos::RDB_COORD_t
end

type RDB_ROAD_POS_t <: RDB_PACKAGE_ELEMENT
    playerId::UInt32
    roadId::UInt16
    laneId::Int8
    flags::UInt8
    roadS::Cfloat
    roadT::Cfloat
    laneOffset::Cfloat
    hdgRel::Cfloat
    pitchRel::Cfloat
    rollRel::Cfloat
    roadType::UInt8
    spare1::UInt8
    spare2::UInt16
    pathS::Cfloat
end

type RDB_ROADMARK_t <: RDB_PACKAGE_ELEMENT
    playerId::UInt32
    id::Int8
    prevId::Int8
    nextId::Int8
    spare0::UInt8
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
    thetype::UInt8
    color::UInt8
    noDataPoints::UInt16
    #spare1::(UInt32, UInt32) #in type definition, expected Type{T}, got Tuple{DataType,DataType}
    spare1::Union{UInt32, UInt32} #Xiaobai
end

type RDB_LANE_INFO_t <: RDB_PACKAGE_ELEMENT
    roadId::UInt16
    id::Int8
    neighborMask::UInt8
    leftLaneId::Int8
    rightLaneId::Int8
    borderType::UInt8
    material::UInt8
    status::UInt16
    thetype::UInt16
    width::Cfloat
    curvVert::Cdouble
    curvVertDot::Cdouble
    curvHor::Cdouble
    curvHorDot::Cdouble
    playerId::UInt32
    spare1::UInt32
end

type RDB_OBJECT_CFG_t <: RDB_PACKAGE_ELEMENT
    id::UInt32
    category::UInt8
    thetype::UInt8
    modelId::Int16
    flags::UInt16
    spare0::UInt16
    spare1::UInt32
end

type RDB_GEOMETRY_t <: RDB_PACKAGE_ELEMENT
    dimX::Cfloat
    dimY::Cfloat
    dimZ::Cfloat
    offX::Cfloat
    offY::Cfloat
    offZ::Cfloat
end

type RDB_OBJECT_STATE_BASE_t
    id::UInt32
    category::UInt8
    thetype::UInt8
    visMask::UInt16
    geo::RDB_GEOMETRY_t
    pos::RDB_COORD_t
    parent::UInt32
    spare1::UInt32
end

type RDB_OBJECT_STATE_EXT_t
    speed::RDB_COORD_t
    accel::RDB_COORD_t
    #spare::(UInt32, UInt32, UInt32, UInt32)
    spare::Union{UInt32, UInt32, UInt32, UInt32} #Xiaobai
end

type RDB_OBJECT_STATE_t <: RDB_PACKAGE_ELEMENT
    base::RDB_OBJECT_STATE_BASE_t
    ext::RDB_OBJECT_STATE_EXT_t
end

type RDB_ENGINE_BASE_t
    playerId::UInt32
    rps::Cfloat
    load::Cfloat
    #spare1::(UInt32, UInt32)
    spare1::Union{UInt32, UInt32} #Xiaobai
end

type RDB_ENGINE_EXT_t
    rpsStart::Cfloat
    torque::Cfloat
    torqueInner::Cfloat
    torqueMax::Cfloat
    torqueFriction::Cfloat
    fuelCurrent::Cfloat
    fuelAverage::Cfloat
    #spare::(UInt32, UInt32)
    spare::Union{UInt32, UInt32} #Xiaobai
end

type RDB_ENGINE_t <: RDB_PACKAGE_ELEMENT
    base::RDB_ENGINE_BASE_t
    ext::RDB_ENGINE_EXT_t
end

type RDB_DRIVETRAIN_BASE_t
    playerId::UInt32
    gearBoxType::UInt8
    driveTrainType::UInt8
    gear::UInt8
    spare0::UInt8
    #spare1::(UInt32, UInt32)
    spare1::Union{UInt32, UInt32} #Xiaobai
end

type RDB_DRIVETRAIN_EXT_t
    torqueGearBoxIn::Cfloat
    torqueCenterDiffOut::Cfloat
    torqueShaft::Cfloat
    #spare1::(UInt32, UInt32)
    spare1::Union{UInt32, UInt32} #Xiaobai
end

type RDB_DRIVETRAIN_t <: RDB_PACKAGE_ELEMENT
    base::RDB_DRIVETRAIN_BASE_t
    ext::RDB_DRIVETRAIN_EXT_t
end

type RDB_WHEEL_BASE_t
    playerId::UInt32
    id::UInt8
    flags::UInt8
    #spare0::(UInt8, UInt8)
    spare0::Union{UInt8, UInt8} #Xiaobai
    radiusStatic::Cfloat
    springCompression::Cfloat
    rotAngle::Cfloat
    slip::Cfloat
    steeringAngle::Cfloat
    #spare1::(UInt32, UInt32, UInt32, UInt32)
    spare1::Union{UInt32, UInt32, UInt32, UInt32} #Xiaobai
end

type RDB_WHEEL_EXT_t
    vAngular::Cfloat
    forceZ::Cfloat
    forceLat::Cfloat
    forceLong::Cfloat
    #forceTireWheelXYZ::(Cfloat, Cfloat, Cfloat)
    forceTireWheelXYZ::Union{Cfloat, Cfloat, Cfloat} #Xiaobai
    radiusDynamic::Cfloat
    brakePressure::Cfloat
    torqueDriveShaft::Cfloat
    damperSpeed::Cfloat
    #spare2::(UInt32, UInt32, UInt32, UInt32)
    spare2::Union{UInt32, UInt32, UInt32, UInt32} #Xiaobai
end

type RDB_WHEEL_t <: RDB_PACKAGE_ELEMENT
    base::RDB_WHEEL_BASE_t
    ext::RDB_WHEEL_EXT_t
end

type RDB_VEHICLE_SYSTEMS_t <: RDB_PACKAGE_ELEMENT
    playerId::UInt32
    lightMask::UInt32
    steering::Cfloat
    steeringWheelTorque::Cfloat
    accMask::UInt8
    accSpeed::UInt8
    batteryState::UInt8
    batteryRate::Int8
    displayLightMask::UInt16
    spare0::UInt16
    #spare::(UInt32, UInt32, UInt32, UInt32, UInt32)
    spare::Union{UInt32, UInt32, UInt32, UInt32, UInt32} #Xiaobai
end

type RDB_VEHICLE_SETUP_t <: RDB_PACKAGE_ELEMENT
    playerId::UInt32
    mass::Cfloat
    wheelBase::Cfloat
    #spare::(Int32, Int32, Int32, Int32)
    spare::Union{Int32, Int32, Int32, Int32} #Xiaobai
end

type RDB_IMAGE_t <: RDB_PACKAGE_ELEMENT
    id::UInt32
    width::UInt16
    height::UInt16
    pixelSize::UInt8
    pixelFormat::UInt8
    cameraId::UInt16
    imgSize::UInt32
    #color::(UInt8, UInt8, UInt8, UInt8)
    color::Union{UInt8, UInt8, UInt8, UInt8} #Xiaobai
    #spare1::(UInt32, UInt32, UInt32)
    spare1::Union{UInt32, UInt32, UInt32} #Xiaobai
end

type RDB_FUNCTION_t <: RDB_PACKAGE_ELEMENT
    id::UInt32
    thetype::UInt8
    dimension::UInt8
    spare::UInt16
    dataSize::UInt32
    #spare1::(UInt32, UInt32, UInt32, UInt32)
    spare1::Union{UInt32, UInt32, UInt32, UInt32} #Xiaobai
end

type RDB_SENSOR_STATE_t <: RDB_PACKAGE_ELEMENT
    id::UInt32
    thetype::UInt8
    hostCategory::UInt8
    spare0::UInt16
    hostId::UInt32
    #fovHV::(Cfloat, Cfloat)
    fovHV::Union{Cfloat, Cfloat} #Xiaobai
    #clipNF::(Cfloat, Cfloat)
    clipNF::Union{Cfloat, Cfloat}
    pos::RDB_COORD_t
    originCoordSys::RDB_COORD_t
    #spare::(Int32, Int32, Int32, Int32)
    spare::Union{Int32, Int32, Int32, Int32} #Xiaobai
end

type RDB_SENSOR_OBJECT_t <: RDB_PACKAGE_ELEMENT
    category::UInt8
    thetype::UInt8
    flags::UInt16
    id::UInt32
    sensorId::UInt32
    dist::Cdouble
    sensorPos::RDB_COORD_t
    occlusion::Int8
    #spare0::(UInt8, UInt8, UInt8)
    spare0::Union{UInt8, UInt8, UInt8}
    #spare::(UInt32, UInt32, UInt32)
    spare::Union{UInt32, UInt32, UInt32}
end

type RDB_CAMERA_t <: RDB_PACKAGE_ELEMENT
    id::UInt16
    width::UInt16
    height::UInt16
    spare0::UInt16
    clipNear::Cfloat
    clipFar::Cfloat
    focalX::Cfloat
    focalY::Cfloat
    principalX::Cfloat
    principalY::Cfloat
    pos::RDB_COORD_t
    #spare1::(UInt32, UInt32, UInt32, UInt32)
    spare1::Union{UInt32, UInt32, UInt32, UInt32}
end

type RDB_LIGHT_SOURCE_BASE_t
    id::UInt16
    templateId::Int8
    state::UInt8
    playerId::Int32
    pos::RDB_COORD_t
    flags::UInt16
    spare0::UInt16
    #spare1::(Int32, Int32)
    spare1::Union{Int32, Int32}
end

type RDB_LIGHT_SOURCE_EXT_t
    #nearFar::(Cfloat, Cfloat)
    nearFar::Union{Cfloat, Cfloat}
    #frustumLRBT::(Cfloat, Cfloat, Cfloat, Cfloat)
    frustumLRBT::Union{Cfloat, Cfloat, Cfloat, Cfloat}
    #intensity::(Cfloat, Cfloat, Cfloat)
    intensity::Union{Cfloat, Cfloat, Cfloat}
    #atten::(Cfloat, Cfloat, Cfloat)
    atten::Union{Cfloat, Cfloat, Cfloat}
    #spare1::(Int32, Int32, Int32)
    spare1::Union{Int32, Int32, Int32}
end

type RDB_LIGHT_SOURCE_t <: RDB_PACKAGE_ELEMENT
    base::RDB_LIGHT_SOURCE_BASE_t
    ext::RDB_LIGHT_SOURCE_EXT_t
end

type RDB_CONTACT_POINT_t <: RDB_PACKAGE_ELEMENT
    id::UInt16
    flags::UInt16
    roadDataIn::RDB_COORD_t
    friction::Cfloat
    playerId::Int32
    spare1::Int32
end

type RDB_TRAFFIC_SIGN_t <: RDB_PACKAGE_ELEMENT
    id::UInt32
    playerId::UInt32
    roadDist::Cfloat
    pos::RDB_COORD_t
    thetype::Int32
    subType::Int32
    value::Cfloat
    state::UInt32
    readability::Int8
    occlusion::Int8
    spare0::UInt16
    addOnId::UInt32
    minLane::Int8
    maxLane::Int8
    spare::UInt16
end

type RDB_ROAD_STATE_t <: RDB_PACKAGE_ELEMENT
    playerId::UInt32
    wheelId::Int8
    spare0::UInt8
    spare1::UInt16
    roadId::UInt32
    defaultSpeed::Cfloat
    waterLevel::Cfloat
    eventMask::UInt32
    #spare2::(Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32)
    spare2::Union{Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32}
end

type RDB_ENVIRONMENT_t <: RDB_PACKAGE_ELEMENT
    visibility::Cfloat
    timeOfDay::UInt32
    brightness::Cfloat
    precipitation::UInt8
    cloudState::UInt8
    flags::UInt16
    #spare1::(UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32)
    spare1::Union{UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32}
end

type RDB_PED_ANIMATION_t <: RDB_PACKAGE_ELEMENT
    playerId::UInt32
    pos::RDB_COORD_t
    #spare::(UInt32, UInt32, UInt32, UInt32)
    spare::Union{UInt32, UInt32, UInt32, UInt32}
    noCoords::UInt32
    dataSize::UInt32
end

type RDB_CUSTOM_SCORING_t <: RDB_PACKAGE_ELEMENT
    playerId::UInt32
    pathS::Cfloat
    roadS::Cfloat
    fuelCurrent::Cfloat
    fuelAverage::Cfloat
    stateFlags::UInt32
    slip::Cfloat
    #spare::(UInt32, UInt32, UInt32, UInt32)
    spare::Union{UInt32, UInt32, UInt32, UInt32}
end

type RDB_TRIGGER_t <: RDB_PACKAGE_ELEMENT
    deltaT::Cfloat
    frameNo::UInt32
    spare::Int32
end

type RDB_DRIVER_CTRL_t <: RDB_PACKAGE_ELEMENT
    playerId::UInt32
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
    gear::UInt8
    sourceId::UInt8
    #spare0::(UInt8, UInt8)
    spare0::Union{UInt8, UInt8}
    validityFlags::UInt32
    flags::UInt32
    mockupInput0::UInt32
    mockupInput1::UInt32
    mockupInput2::UInt32
    spare::UInt32
end

type RDB_DRIVER_PERCEPTION_t <: RDB_PACKAGE_ELEMENT
    playerId::UInt32
    speedFromRules::Cfloat
    distToSpeed::Cfloat
    #spare0::(Cfloat, Cfloat, Cfloat, Cfloat)
    spare0::Union{Cfloat, Cfloat, Cfloat, Cfloat}
    flags::UInt32
    #spare::(UInt32, UInt32, UInt32, UInt32)
    spare::Union{UInt32, UInt32, UInt32, UInt32}
end

type RDB_TRAFFIC_LIGHT_BASE_t
    id::Int32
    state::Cfloat
    stateMask::UInt32
end

type RDB_TRAFFIC_LIGHT_PHASE_t
    duration::Cfloat
    thetype::UInt8
    #spare::(UInt8, UInt8, UInt8)
    spare::Union{UInt8, UInt8, UInt8}
end

type RDB_TRAFFIC_LIGHT_EXT_t
    ctrlId::Int32
    cycleTime::Cfloat
    noPhases::UInt16
    dataSize::UInt32
end

type RDB_TRAFFIC_LIGHT_t <: RDB_PACKAGE_ELEMENT
    base::RDB_TRAFFIC_LIGHT_BASE_t
    ext::RDB_TRAFFIC_LIGHT_EXT_t
end

type RDB_SYNC_t <: RDB_PACKAGE_ELEMENT
    mask::UInt32
    cmdMask::UInt32
    systemTime::Cdouble
end

type RDB_ROAD_QUERY_t
    id::UInt16
    flags::UInt16
    #spare::(UInt16, UInt16)
    spare::Union{UInt16, UInt16}
    x::Cdouble
    y::Cdouble
end

type RDB_SCP_t
    version::UInt16
    spare::UInt16
    dataSize::UInt32
end

type RDB_PROXY_t <: RDB_PACKAGE_ELEMENT
    protocol::UInt16
    pkgId::UInt16
    #spare::(UInt32, UInt32, UInt32, UInt32, UInt32, UInt32)
    spare::Union{UInt32, UInt32, UInt32, UInt32, UInt32, UInt32}
    dataSize::UInt32
end

type RDB_TRAJECTORY_t
    playerId::UInt32
    spacing::Cdouble
    flags::UInt16
    noDataPoints::UInt16
    #spare::(UInt32, UInt32, UInt32, UInt32)
    spare::Union{UInt32, UInt32, UInt32, UInt32}
end

type RDB_MOTION_SYSTEM_t <: RDB_PACKAGE_ELEMENT
    playerId::UInt32
    flags::UInt32
    pos::RDB_COORD_t
    speed::RDB_COORD_t
    #spare::(UInt32, UInt32, UInt32, UInt32, UInt32, UInt32)
    spare::Union{UInt32, UInt32, UInt32, UInt32, UInt32, UInt32}
end

type RDB_END_OF_FRAME_t
end

type RDB_START_OF_FRAME_t
end

type RDB_STEER_2_DYN_t
    playerId::UInt32
    state::UInt32
    angle::Cfloat
    rev::Cfloat
    torque::Cfloat
    #spare::(UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32)
    spare::Union{UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32}
end

type RDB_DYN_2_STEER_t
    playerId::UInt32
    state::UInt16
    cmd::UInt16
    effects::UInt32
    torque::Cfloat
    friction::Cfloat
    damping::Cfloat
    stiffness::Cfloat
    velocity::Cfloat
    angle::Cfloat
    #spare::(UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32)
    spare::Union{UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32}
end

type RDB_MSG_HDR_t
    magicNo::UInt16
    version::UInt16
    headerSize::UInt32
    dataSize::UInt32
    frameNo::UInt32
    simTime::Cdouble
end

type RDB_MSG_ENTRY_HDR_t
    headerSize::UInt32
    dataSize::UInt32
    elementSize::UInt32
    pkgId::UInt16
    flags::UInt16
end

# type RDB_MSG_t
#     hdr::RDB_MSG_HDR_t
#     entryHdr::RDB_MSG_ENTRY_HDR_t
#     u::RDB_MSG_UNION_t
# end

type RDB_SHM_BUFFER_INFO_t
    thisSize::UInt32
    bufferSize::UInt32
    id::UInt16
    spare0::UInt16
    flags::UInt32
    offset::UInt32
    #spare1::(UInt32, UInt32, UInt32, UInt32)
    spare1::Union{UInt32, UInt32, UInt32, UInt32}
end

type RDB_SHM_HDR_t
    headerSize::UInt32
    dataSize::UInt32
    noBuffers::UInt8
end

function Base.read(io::IO, ::Type{RDB_POINT_t})
    x = read(io, Cdouble)
    y = read(io, Cdouble)
    z = read(io, Cdouble)
    flags = read(io, UInt8)
    thetype = read(io, UInt8)
    system = read(io, UInt16)
    RDB_POINT_t(x, y, z, flags, thetype, system)
end
function Base.read!(io::IO, struct::RDB_POINT_t)
    struct.x = read(io, Cdouble)
    struct.y = read(io, Cdouble)
    struct.z = read(io, Cdouble)
    struct.flags = read(io, UInt8)
    struct.thetype = read(io, UInt8)
    struct.system = read(io, UInt16)
    struct
end
function Base.write(io::IO, struct::RDB_POINT_t)
    write(io, struct.x)
    write(io, struct.y)
    write(io, struct.z)
    write(io, struct.flags)
    write(io, struct.thetype)
    write(io, struct.system)
end
function Base.show(io::IO, struct::RDB_POINT_t)
    println(io, "RDB_POINT_t:")
    @printf(io, "   x:       %+.16e\n",struct.x)
    @printf(io, "   y:       %+.16e\n",struct.y)
    @printf(io, "   z:       %+.16e\n",struct.z)
    @printf(io, "   flags:   %s\n", hex(struct.flags))
    @printf(io, "   thetype: %s\n", hex(struct.thetype))
    @printf(io, "   system:  %s\n", hex(struct.system))
end

function Base.read(io::IO, ::Type{RDB_COORD_t})
    x = read(io, Cdouble)
    y = read(io, Cdouble)
    z = read(io, Cdouble)
    h = read(io, Cfloat)
    p = read(io, Cfloat)
    r = read(io, Cfloat)
    flags = read(io, UInt8)
    thetype = read(io, UInt8)
    system = read(io, UInt16)
    RDB_COORD_t(x, y, z, h, p, r, flags, thetype, system)
end
function Base.read!(io::IO, struct::RDB_COORD_t)
    struct.x = read(io, Cdouble)
    struct.y = read(io, Cdouble)
    struct.z = read(io, Cdouble)
    struct.h = read(io, Cfloat)
    struct.p = read(io, Cfloat)
    struct.r = read(io, Cfloat)
    struct.flags = read(io, UInt8)
    struct.thetype = read(io, UInt8)
    struct.system = read(io, UInt16)
    struct
end
function Base.write(io::IO, struct::RDB_COORD_t)
    write(io, struct.x)
    write(io, struct.y)
    write(io, struct.z)
    write(io, struct.h)
    write(io, struct.p)
    write(io, struct.r)
    write(io, struct.flags)
    write(io, struct.thetype)
    write(io, struct.system)
end
function Base.show(io::IO, struct::RDB_COORD_t)
    println(io, "RDB_COORD_t:")
    @printf(io, "   x:       %+.16e\n",struct.x)
    @printf(io, "   y:       %+.16e\n",struct.y)
    @printf(io, "   z:       %+.16e\n",struct.z)
    @printf(io, "   h:       %+.16e\n",struct.h)
    @printf(io, "   p:       %+.16e\n",struct.p)
    @printf(io, "   r:       %+.16e\n",struct.r)
    @printf(io, "   flags:   %s\n", hex(struct.flags))
    @printf(io, "   thetype: %s\n", hex(struct.thetype))
    @printf(io, "   system:  %s\n", hex(struct.system))
end

function Base.read(io::IO, ::Type{RDB_COORD_SYSTEM_t})
    id = read(io, UInt16)
    spare = read(io, UInt16)
    pos = read(io, RDB_COORD_t)
    RDB_COORD_SYSTEM_t(id, spare, pos)
end
function Base.read!(io::IO, struct::RDB_COORD_SYSTEM_t)
    struct.id = read(io, UInt16)
    struct.spare = read(io, UInt16)
    struct.pos = read(io, RDB_COORD_t)
    struct
end
function Base.write(io::IO, struct::RDB_COORD_SYSTEM_t)
    write(io, struct.id)
    write(io, struct.spare)
    write(io, struct.pos)
end
function Base.show(io::IO, struct::RDB_COORD_SYSTEM_t)
    println(io, "RDB_COORD_SYSTEM_t:")
    @printf(io, "   id:    %s\n", hex(struct.id))
    @printf(io, "   spare: %s\n", hex(struct.spare))
    @printf(io, "   pos:   RDB_COORD_t\n")
end

function Base.read(io::IO, ::Type{RDB_ROAD_POS_t})
    playerId = read(io, UInt32)
    roadId = read(io, UInt16)
    laneId = read(io, Int8)
    flags = read(io, UInt8)
    roadS = read(io, Cfloat)
    roadT = read(io, Cfloat)
    laneOffset = read(io, Cfloat)
    hdgRel = read(io, Cfloat)
    pitchRel = read(io, Cfloat)
    rollRel = read(io, Cfloat)
    roadType = read(io, UInt8)
    spare1 = read(io, UInt8)
    spare2 = read(io, UInt16)
    pathS = read(io, Cfloat)
    RDB_ROAD_POS_t(playerId, roadId, laneId, flags, roadS, roadT, laneOffset, hdgRel, pitchRel, rollRel, roadType, spare1, spare2, pathS)
end
function Base.read!(io::IO, struct::RDB_ROAD_POS_t)
    struct.playerId = read(io, UInt32)
    struct.roadId = read(io, UInt16)
    struct.laneId = read(io, Int8)
    struct.flags = read(io, UInt8)
    struct.roadS = read(io, Cfloat)
    struct.roadT = read(io, Cfloat)
    struct.laneOffset = read(io, Cfloat)
    struct.hdgRel = read(io, Cfloat)
    struct.pitchRel = read(io, Cfloat)
    struct.rollRel = read(io, Cfloat)
    struct.roadType = read(io, UInt8)
    struct.spare1 = read(io, UInt8)
    struct.spare2 = read(io, UInt16)
    struct.pathS = read(io, Cfloat)
    struct
end
function Base.write(io::IO, struct::RDB_ROAD_POS_t)
    write(io, struct.playerId)
    write(io, struct.roadId)
    write(io, struct.laneId)
    write(io, struct.flags)
    write(io, struct.roadS)
    write(io, struct.roadT)
    write(io, struct.laneOffset)
    write(io, struct.hdgRel)
    write(io, struct.pitchRel)
    write(io, struct.rollRel)
    write(io, struct.roadType)
    write(io, struct.spare1)
    write(io, struct.spare2)
    write(io, struct.pathS)
end
function Base.show(io::IO, struct::RDB_ROAD_POS_t)
    println(io, "RDB_ROAD_POS_t:")
    @printf(io, "   playerId:   %s\n", hex(struct.playerId))
    @printf(io, "   roadId:     %s\n", hex(struct.roadId))
    @printf(io, "   laneId:     %d\n",struct.laneId)
    @printf(io, "   flags:      %s\n", hex(struct.flags))
    @printf(io, "   roadS:      %+.16e\n",struct.roadS)
    @printf(io, "   roadT:      %+.16e\n",struct.roadT)
    @printf(io, "   laneOffset: %+.16e\n",struct.laneOffset)
    @printf(io, "   hdgRel:     %+.16e\n",struct.hdgRel)
    @printf(io, "   pitchRel:   %+.16e\n",struct.pitchRel)
    @printf(io, "   rollRel:    %+.16e\n",struct.rollRel)
    @printf(io, "   roadType:   %s\n", hex(struct.roadType))
    @printf(io, "   spare1:     %s\n", hex(struct.spare1))
    @printf(io, "   spare2:     %s\n", hex(struct.spare2))
    @printf(io, "   pathS:      %+.16e\n",struct.pathS)
end

function Base.read(io::IO, ::Type{RDB_ROADMARK_t})
    playerId = read(io, UInt32)
    id = read(io, Int8)
    prevId = read(io, Int8)
    nextId = read(io, Int8)
    spare0 = read(io, UInt8)
    lateralDist = read(io, Cfloat)
    yawRel = read(io, Cfloat)
    curvHor = read(io, Cdouble)
    curvHorDot = read(io, Cdouble)
    startDx = read(io, Cfloat)
    previewDx = read(io, Cfloat)
    width = read(io, Cfloat)
    height = read(io, Cfloat)
    curvVert = read(io, Cdouble)
    curvVertDot = read(io, Cdouble)
    thetype = read(io, UInt8)
    color = read(io, UInt8)
    noDataPoints = read(io, UInt16)
    spare1 = (read(io, UInt32), read(io, UInt32))
    RDB_ROADMARK_t(playerId, id, prevId, nextId, spare0, lateralDist, yawRel, curvHor, curvHorDot, startDx, previewDx, width, height, curvVert, curvVertDot, thetype, color, noDataPoints, spare1)
end
function Base.read!(io::IO, struct::RDB_ROADMARK_t)
    struct.playerId = read(io, UInt32)
    struct.id = read(io, Int8)
    struct.prevId = read(io, Int8)
    struct.nextId = read(io, Int8)
    struct.spare0 = read(io, UInt8)
    struct.lateralDist = read(io, Cfloat)
    struct.yawRel = read(io, Cfloat)
    struct.curvHor = read(io, Cdouble)
    struct.curvHorDot = read(io, Cdouble)
    struct.startDx = read(io, Cfloat)
    struct.previewDx = read(io, Cfloat)
    struct.width = read(io, Cfloat)
    struct.height = read(io, Cfloat)
    struct.curvVert = read(io, Cdouble)
    struct.curvVertDot = read(io, Cdouble)
    struct.thetype = read(io, UInt8)
    struct.color = read(io, UInt8)
    struct.noDataPoints = read(io, UInt16)
    struct.spare1 = (read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_ROADMARK_t)
    write(io, struct.playerId)
    write(io, struct.id)
    write(io, struct.prevId)
    write(io, struct.nextId)
    write(io, struct.spare0)
    write(io, struct.lateralDist)
    write(io, struct.yawRel)
    write(io, struct.curvHor)
    write(io, struct.curvHorDot)
    write(io, struct.startDx)
    write(io, struct.previewDx)
    write(io, struct.width)
    write(io, struct.height)
    write(io, struct.curvVert)
    write(io, struct.curvVertDot)
    write(io, struct.thetype)
    write(io, struct.color)
    write(io, struct.noDataPoints)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_ROADMARK_t)
    println(io, "RDB_ROADMARK_t:")
    @printf(io, "   playerId:     %s\n", hex(struct.playerId))
    @printf(io, "   id:           %d\n",struct.id)
    @printf(io, "   prevId:       %d\n",struct.prevId)
    @printf(io, "   nextId:       %d\n",struct.nextId)
    @printf(io, "   spare0:       %s\n", hex(struct.spare0))
    @printf(io, "   lateralDist:  %+.16e\n",struct.lateralDist)
    @printf(io, "   yawRel:       %+.16e\n",struct.yawRel)
    @printf(io, "   curvHor:      %+.16e\n",struct.curvHor)
    @printf(io, "   curvHorDot:   %+.16e\n",struct.curvHorDot)
    @printf(io, "   startDx:      %+.16e\n",struct.startDx)
    @printf(io, "   previewDx:    %+.16e\n",struct.previewDx)
    @printf(io, "   width:        %+.16e\n",struct.width)
    @printf(io, "   height:       %+.16e\n",struct.height)
    @printf(io, "   curvVert:     %+.16e\n",struct.curvVert)
    @printf(io, "   curvVertDot:  %+.16e\n",struct.curvVertDot)
    @printf(io, "   thetype:      %s\n", hex(struct.thetype))
    @printf(io, "   color:        %s\n", hex(struct.color))
    @printf(io, "   noDataPoints: %s\n", hex(struct.noDataPoints))
    @printf(io, "   spare1:       %s\n", hex(struct.spare1))
end
Base.sizeof(::RDB_ROADMARK_t) = 76
Base.sizeof(::Type{RDB_ROADMARK_t}) = 76

function Base.read(io::IO, ::Type{RDB_LANE_INFO_t})
    roadId = read(io, UInt16)
    id = read(io, Int8)
    neighborMask = read(io, UInt8)
    leftLaneId = read(io, Int8)
    rightLaneId = read(io, Int8)
    borderType = read(io, UInt8)
    material = read(io, UInt8)
    status = read(io, UInt16)
    thetype = read(io, UInt16)
    width = read(io, Cfloat)
    curvVert = read(io, Cdouble)
    curvVertDot = read(io, Cdouble)
    curvHor = read(io, Cdouble)
    curvHorDot = read(io, Cdouble)
    playerId = read(io, UInt32)
    spare1 = read(io, UInt32)
    RDB_LANE_INFO_t(roadId, id, neighborMask, leftLaneId, rightLaneId, borderType, material, status, thetype, width, curvVert, curvVertDot, curvHor, curvHorDot, playerId, spare1)
end
function Base.read!(io::IO, struct::RDB_LANE_INFO_t)
    struct.roadId = read(io, UInt16)
    struct.id = read(io, Int8)
    struct.neighborMask = read(io, UInt8)
    struct.leftLaneId = read(io, Int8)
    struct.rightLaneId = read(io, Int8)
    struct.borderType = read(io, UInt8)
    struct.material = read(io, UInt8)
    struct.status = read(io, UInt16)
    struct.thetype = read(io, UInt16)
    struct.width = read(io, Cfloat)
    struct.curvVert = read(io, Cdouble)
    struct.curvVertDot = read(io, Cdouble)
    struct.curvHor = read(io, Cdouble)
    struct.curvHorDot = read(io, Cdouble)
    struct.playerId = read(io, UInt32)
    struct.spare1 = read(io, UInt32)
    struct
end
function Base.write(io::IO, struct::RDB_LANE_INFO_t)
    write(io, struct.roadId)
    write(io, struct.id)
    write(io, struct.neighborMask)
    write(io, struct.leftLaneId)
    write(io, struct.rightLaneId)
    write(io, struct.borderType)
    write(io, struct.material)
    write(io, struct.status)
    write(io, struct.thetype)
    write(io, struct.width)
    write(io, struct.curvVert)
    write(io, struct.curvVertDot)
    write(io, struct.curvHor)
    write(io, struct.curvHorDot)
    write(io, struct.playerId)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_LANE_INFO_t)
    println(io, "RDB_LANE_INFO_t:")
    @printf(io, "   roadId:       %s\n", hex(struct.roadId))
    @printf(io, "   id:           %d\n",struct.id)
    @printf(io, "   neighborMask: %s\n", hex(struct.neighborMask))
    @printf(io, "   leftLaneId:   %d\n",struct.leftLaneId)
    @printf(io, "   rightLaneId:  %d\n",struct.rightLaneId)
    @printf(io, "   borderType:   %s\n", hex(struct.borderType))
    @printf(io, "   material:     %s\n", hex(struct.material))
    @printf(io, "   status:       %s\n", hex(struct.status))
    @printf(io, "   thetype:      %s\n", hex(struct.thetype))
    @printf(io, "   width:        %+.16e\n",struct.width)
    @printf(io, "   curvVert:     %+.16e\n",struct.curvVert)
    @printf(io, "   curvVertDot:  %+.16e\n",struct.curvVertDot)
    @printf(io, "   curvHor:      %+.16e\n",struct.curvHor)
    @printf(io, "   curvHorDot:   %+.16e\n",struct.curvHorDot)
    @printf(io, "   playerId:     %s\n", hex(struct.playerId))
    @printf(io, "   spare1:       %s\n", hex(struct.spare1))
end

function Base.read(io::IO, ::Type{RDB_OBJECT_CFG_t})
    id = read(io, UInt32)
    category = read(io, UInt8)
    thetype = read(io, UInt8)
    modelId = read(io, Int16)
    flags = read(io, UInt16)
    spare0 = read(io, UInt16)
    spare1 = read(io, UInt32)
    RDB_OBJECT_CFG_t(id, category, thetype, modelId, flags, spare0, spare1)
end
function Base.read!(io::IO, struct::RDB_OBJECT_CFG_t)
    struct.id = read(io, UInt32)
    struct.category = read(io, UInt8)
    struct.thetype = read(io, UInt8)
    struct.modelId = read(io, Int16)
    struct.flags = read(io, UInt16)
    struct.spare0 = read(io, UInt16)
    struct.spare1 = read(io, UInt32)
    struct
end
function Base.write(io::IO, struct::RDB_OBJECT_CFG_t)
    write(io, struct.id)
    write(io, struct.category)
    write(io, struct.thetype)
    write(io, struct.modelId)
    write(io, struct.flags)
    write(io, struct.spare0)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_OBJECT_CFG_t)
    println(io, "RDB_OBJECT_CFG_t:")
    @printf(io, "   id:       %s\n", hex(struct.id))
    @printf(io, "   category: %s\n", hex(struct.category))
    @printf(io, "   thetype:  %s\n", hex(struct.thetype))
    @printf(io, "   modelId:  %d\n",struct.modelId)
    @printf(io, "   flags:    %s\n", hex(struct.flags))
    @printf(io, "   spare0:   %s\n", hex(struct.spare0))
    @printf(io, "   spare1:   %s\n", hex(struct.spare1))
end

function Base.read(io::IO, ::Type{RDB_GEOMETRY_t})
    dimX = read(io, Cfloat)
    dimY = read(io, Cfloat)
    dimZ = read(io, Cfloat)
    offX = read(io, Cfloat)
    offY = read(io, Cfloat)
    offZ = read(io, Cfloat)
    RDB_GEOMETRY_t(dimX, dimY, dimZ, offX, offY, offZ)
end
function Base.read!(io::IO, struct::RDB_GEOMETRY_t)
    struct.dimX = read(io, Cfloat)
    struct.dimY = read(io, Cfloat)
    struct.dimZ = read(io, Cfloat)
    struct.offX = read(io, Cfloat)
    struct.offY = read(io, Cfloat)
    struct.offZ = read(io, Cfloat)
    struct
end
function Base.write(io::IO, struct::RDB_GEOMETRY_t)
    write(io, struct.dimX)
    write(io, struct.dimY)
    write(io, struct.dimZ)
    write(io, struct.offX)
    write(io, struct.offY)
    write(io, struct.offZ)
end
function Base.show(io::IO, struct::RDB_GEOMETRY_t)
    println(io, "RDB_GEOMETRY_t:")
    @printf(io, "   dimX: %+.16e\n",struct.dimX)
    @printf(io, "   dimY: %+.16e\n",struct.dimY)
    @printf(io, "   dimZ: %+.16e\n",struct.dimZ)
    @printf(io, "   offX: %+.16e\n",struct.offX)
    @printf(io, "   offY: %+.16e\n",struct.offY)
    @printf(io, "   offZ: %+.16e\n",struct.offZ)
end

function Base.read(io::IO, ::Type{RDB_OBJECT_STATE_BASE_t})
    id = read(io, UInt32)
    category = read(io, UInt8)
    thetype = read(io, UInt8)
    visMask = read(io, UInt16)
    geo = read(io, RDB_GEOMETRY_t)
    pos = read(io, RDB_COORD_t)
    parent = read(io, UInt32)
    spare1 = read(io, UInt32)
    RDB_OBJECT_STATE_BASE_t(id, category, thetype, visMask, geo, pos, parent, spare1)
end
function Base.read!(io::IO, struct::RDB_OBJECT_STATE_BASE_t)
    struct.id = read(io, UInt32)
    struct.category = read(io, UInt8)
    struct.thetype = read(io, UInt8)
    struct.visMask = read(io, UInt16)
    struct.geo = read(io, RDB_GEOMETRY_t)
    struct.pos = read(io, RDB_COORD_t)
    struct.parent = read(io, UInt32)
    struct.spare1 = read(io, UInt32)
    struct
end
function Base.write(io::IO, struct::RDB_OBJECT_STATE_BASE_t)
    write(io, struct.id)
    write(io, struct.category)
    write(io, struct.thetype)
    write(io, struct.visMask)
    write(io, struct.geo)
    write(io, struct.pos)
    write(io, struct.parent)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_OBJECT_STATE_BASE_t)
    println(io, "RDB_OBJECT_STATE_BASE_t:")
    @printf(io, "   id:       %s\n", hex(struct.id))
    @printf(io, "   category: %s\n", hex(struct.category))
    @printf(io, "   thetype:  %s\n", hex(struct.thetype))
    @printf(io, "   visMask:  %s\n", hex(struct.visMask))
    @printf(io, "   geo:      RDB_GEOMETRY_t\n")
    @printf(io, "   pos:      RDB_COORD_t\n")
    @printf(io, "   parent:   %s\n", hex(struct.parent))
    @printf(io, "   spare1:   %s\n", hex(struct.spare1))
end

function Base.read(io::IO, ::Type{RDB_OBJECT_STATE_EXT_t})
    speed = read(io, RDB_COORD_t)
    accel = read(io, RDB_COORD_t)
    spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_OBJECT_STATE_EXT_t(speed, accel, spare)
end
function Base.read!(io::IO, struct::RDB_OBJECT_STATE_EXT_t)
    struct.speed = read(io, RDB_COORD_t)
    struct.accel = read(io, RDB_COORD_t)
    struct.spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_OBJECT_STATE_EXT_t)
    write(io, struct.speed)
    write(io, struct.accel)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_OBJECT_STATE_EXT_t)
    println(io, "RDB_OBJECT_STATE_EXT_t:")
    @printf(io, "   speed: RDB_COORD_t\n")
    @printf(io, "   accel: RDB_COORD_t\n")
    @printf(io, "   spare: %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_OBJECT_STATE_EXT_t) = 104
Base.sizeof(::Type{RDB_OBJECT_STATE_EXT_t}) = 104

function Base.read(io::IO, ::Type{RDB_OBJECT_STATE_t})
    base = read(io, RDB_OBJECT_STATE_BASE_t)
    ext = read(io, RDB_OBJECT_STATE_EXT_t)
    RDB_OBJECT_STATE_t(base, ext)
end
function Base.read!(io::IO, struct::RDB_OBJECT_STATE_t)
    struct.base = read(io, RDB_OBJECT_STATE_BASE_t)
    struct.ext = read(io, RDB_OBJECT_STATE_EXT_t)
    struct
end
function Base.write(io::IO, struct::RDB_OBJECT_STATE_t)
    write(io, struct.base)
    write(io, struct.ext)
end
function Base.show(io::IO, struct::RDB_OBJECT_STATE_t)
    println(io, "RDB_OBJECT_STATE_t:")
    @printf(io, "   base: RDB_OBJECT_STATE_BASE_t\n")
    @printf(io, "   ext:  RDB_OBJECT_STATE_EXT_t\n")
end

function Base.read(io::IO, ::Type{RDB_ENGINE_BASE_t})
    playerId = read(io, UInt32)
    rps = read(io, Cfloat)
    load = read(io, Cfloat)
    spare1 = (read(io, UInt32), read(io, UInt32))
    RDB_ENGINE_BASE_t(playerId, rps, load, spare1)
end
function Base.read!(io::IO, struct::RDB_ENGINE_BASE_t)
    struct.playerId = read(io, UInt32)
    struct.rps = read(io, Cfloat)
    struct.load = read(io, Cfloat)
    struct.spare1 = (read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_ENGINE_BASE_t)
    write(io, struct.playerId)
    write(io, struct.rps)
    write(io, struct.load)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_ENGINE_BASE_t)
    println(io, "RDB_ENGINE_BASE_t:")
    @printf(io, "   playerId: %s\n", hex(struct.playerId))
    @printf(io, "   rps:      %+.16e\n",struct.rps)
    @printf(io, "   load:     %+.16e\n",struct.load)
    @printf(io, "   spare1:   %s\n", hex(struct.spare1))
end
Base.sizeof(::RDB_ENGINE_BASE_t) = 20
Base.sizeof(::Type{RDB_ENGINE_BASE_t}) = 20

function Base.read(io::IO, ::Type{RDB_ENGINE_EXT_t})
    rpsStart = read(io, Cfloat)
    torque = read(io, Cfloat)
    torqueInner = read(io, Cfloat)
    torqueMax = read(io, Cfloat)
    torqueFriction = read(io, Cfloat)
    fuelCurrent = read(io, Cfloat)
    fuelAverage = read(io, Cfloat)
    spare = (read(io, UInt32), read(io, UInt32))
    RDB_ENGINE_EXT_t(rpsStart, torque, torqueInner, torqueMax, torqueFriction, fuelCurrent, fuelAverage, spare)
end
function Base.read!(io::IO, struct::RDB_ENGINE_EXT_t)
    struct.rpsStart = read(io, Cfloat)
    struct.torque = read(io, Cfloat)
    struct.torqueInner = read(io, Cfloat)
    struct.torqueMax = read(io, Cfloat)
    struct.torqueFriction = read(io, Cfloat)
    struct.fuelCurrent = read(io, Cfloat)
    struct.fuelAverage = read(io, Cfloat)
    struct.spare = (read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_ENGINE_EXT_t)
    write(io, struct.rpsStart)
    write(io, struct.torque)
    write(io, struct.torqueInner)
    write(io, struct.torqueMax)
    write(io, struct.torqueFriction)
    write(io, struct.fuelCurrent)
    write(io, struct.fuelAverage)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_ENGINE_EXT_t)
    println(io, "RDB_ENGINE_EXT_t:")
    @printf(io, "   rpsStart:       %+.16e\n",struct.rpsStart)
    @printf(io, "   torque:         %+.16e\n",struct.torque)
    @printf(io, "   torqueInner:    %+.16e\n",struct.torqueInner)
    @printf(io, "   torqueMax:      %+.16e\n",struct.torqueMax)
    @printf(io, "   torqueFriction: %+.16e\n",struct.torqueFriction)
    @printf(io, "   fuelCurrent:    %+.16e\n",struct.fuelCurrent)
    @printf(io, "   fuelAverage:    %+.16e\n",struct.fuelAverage)
    @printf(io, "   spare:          %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_ENGINE_EXT_t) = 36
Base.sizeof(::Type{RDB_ENGINE_EXT_t}) = 36

function Base.read(io::IO, ::Type{RDB_ENGINE_t})
    base = read(io, RDB_ENGINE_BASE_t)
    ext = read(io, RDB_ENGINE_EXT_t)
    RDB_ENGINE_t(base, ext)
end
function Base.read!(io::IO, struct::RDB_ENGINE_t)
    struct.base = read(io, RDB_ENGINE_BASE_t)
    struct.ext = read(io, RDB_ENGINE_EXT_t)
    struct
end
function Base.write(io::IO, struct::RDB_ENGINE_t)
    write(io, struct.base)
    write(io, struct.ext)
end
function Base.show(io::IO, struct::RDB_ENGINE_t)
    println(io, "RDB_ENGINE_t:")
    @printf(io, "   base: RDB_ENGINE_BASE_t\n")
    @printf(io, "   ext:  RDB_ENGINE_EXT_t\n")
end

function Base.read(io::IO, ::Type{RDB_DRIVETRAIN_BASE_t})
    playerId = read(io, UInt32)
    gearBoxType = read(io, UInt8)
    driveTrainType = read(io, UInt8)
    gear = read(io, UInt8)
    spare0 = read(io, UInt8)
    spare1 = (read(io, UInt32), read(io, UInt32))
    RDB_DRIVETRAIN_BASE_t(playerId, gearBoxType, driveTrainType, gear, spare0, spare1)
end
function Base.read!(io::IO, struct::RDB_DRIVETRAIN_BASE_t)
    struct.playerId = read(io, UInt32)
    struct.gearBoxType = read(io, UInt8)
    struct.driveTrainType = read(io, UInt8)
    struct.gear = read(io, UInt8)
    struct.spare0 = read(io, UInt8)
    struct.spare1 = (read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_DRIVETRAIN_BASE_t)
    write(io, struct.playerId)
    write(io, struct.gearBoxType)
    write(io, struct.driveTrainType)
    write(io, struct.gear)
    write(io, struct.spare0)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_DRIVETRAIN_BASE_t)
    println(io, "RDB_DRIVETRAIN_BASE_t:")
    @printf(io, "   playerId:       %s\n", hex(struct.playerId))
    @printf(io, "   gearBoxType:    %s\n", hex(struct.gearBoxType))
    @printf(io, "   driveTrainType: %s\n", hex(struct.driveTrainType))
    @printf(io, "   gear:           %s\n", hex(struct.gear))
    @printf(io, "   spare0:         %s\n", hex(struct.spare0))
    @printf(io, "   spare1:         %s\n", hex(struct.spare1))
end
Base.sizeof(::RDB_DRIVETRAIN_BASE_t) = 16
Base.sizeof(::Type{RDB_DRIVETRAIN_BASE_t}) = 16

function Base.read(io::IO, ::Type{RDB_DRIVETRAIN_EXT_t})
    torqueGearBoxIn = read(io, Cfloat)
    torqueCenterDiffOut = read(io, Cfloat)
    torqueShaft = read(io, Cfloat)
    spare1 = (read(io, UInt32), read(io, UInt32))
    RDB_DRIVETRAIN_EXT_t(torqueGearBoxIn, torqueCenterDiffOut, torqueShaft, spare1)
end
function Base.read!(io::IO, struct::RDB_DRIVETRAIN_EXT_t)
    struct.torqueGearBoxIn = read(io, Cfloat)
    struct.torqueCenterDiffOut = read(io, Cfloat)
    struct.torqueShaft = read(io, Cfloat)
    struct.spare1 = (read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_DRIVETRAIN_EXT_t)
    write(io, struct.torqueGearBoxIn)
    write(io, struct.torqueCenterDiffOut)
    write(io, struct.torqueShaft)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_DRIVETRAIN_EXT_t)
    println(io, "RDB_DRIVETRAIN_EXT_t:")
    @printf(io, "   torqueGearBoxIn:     %+.16e\n",struct.torqueGearBoxIn)
    @printf(io, "   torqueCenterDiffOut: %+.16e\n",struct.torqueCenterDiffOut)
    @printf(io, "   torqueShaft:         %+.16e\n",struct.torqueShaft)
    @printf(io, "   spare1:              %s\n", hex(struct.spare1))
end
Base.sizeof(::RDB_DRIVETRAIN_EXT_t) = 20
Base.sizeof(::Type{RDB_DRIVETRAIN_EXT_t}) = 20

function Base.read(io::IO, ::Type{RDB_DRIVETRAIN_t})
    base = read(io, RDB_DRIVETRAIN_BASE_t)
    ext = read(io, RDB_DRIVETRAIN_EXT_t)
    RDB_DRIVETRAIN_t(base, ext)
end
function Base.read!(io::IO, struct::RDB_DRIVETRAIN_t)
    struct.base = read(io, RDB_DRIVETRAIN_BASE_t)
    struct.ext = read(io, RDB_DRIVETRAIN_EXT_t)
    struct
end
function Base.write(io::IO, struct::RDB_DRIVETRAIN_t)
    write(io, struct.base)
    write(io, struct.ext)
end
function Base.show(io::IO, struct::RDB_DRIVETRAIN_t)
    println(io, "RDB_DRIVETRAIN_t:")
    @printf(io, "   base: RDB_DRIVETRAIN_BASE_t\n")
    @printf(io, "   ext:  RDB_DRIVETRAIN_EXT_t\n")
end

function Base.read(io::IO, ::Type{RDB_WHEEL_BASE_t})
    playerId = read(io, UInt32)
    id = read(io, UInt8)
    flags = read(io, UInt8)
    spare0 = (read(io, UInt8), read(io, UInt8))
    radiusStatic = read(io, Cfloat)
    springCompression = read(io, Cfloat)
    rotAngle = read(io, Cfloat)
    slip = read(io, Cfloat)
    steeringAngle = read(io, Cfloat)
    spare1 = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_WHEEL_BASE_t(playerId, id, flags, spare0, radiusStatic, springCompression, rotAngle, slip, steeringAngle, spare1)
end
function Base.read!(io::IO, struct::RDB_WHEEL_BASE_t)
    struct.playerId = read(io, UInt32)
    struct.id = read(io, UInt8)
    struct.flags = read(io, UInt8)
    struct.spare0 = (read(io, UInt8), read(io, UInt8))
    struct.radiusStatic = read(io, Cfloat)
    struct.springCompression = read(io, Cfloat)
    struct.rotAngle = read(io, Cfloat)
    struct.slip = read(io, Cfloat)
    struct.steeringAngle = read(io, Cfloat)
    struct.spare1 = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_WHEEL_BASE_t)
    write(io, struct.playerId)
    write(io, struct.id)
    write(io, struct.flags)
    write(io, struct.spare0)
    write(io, struct.radiusStatic)
    write(io, struct.springCompression)
    write(io, struct.rotAngle)
    write(io, struct.slip)
    write(io, struct.steeringAngle)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_WHEEL_BASE_t)
    println(io, "RDB_WHEEL_BASE_t:")
    @printf(io, "   playerId:          %s\n", hex(struct.playerId))
    @printf(io, "   id:                %s\n", hex(struct.id))
    @printf(io, "   flags:             %s\n", hex(struct.flags))
    @printf(io, "   spare0:            %s\n", hex(struct.spare0))
    @printf(io, "   radiusStatic:      %+.16e\n",struct.radiusStatic)
    @printf(io, "   springCompression: %+.16e\n",struct.springCompression)
    @printf(io, "   rotAngle:          %+.16e\n",struct.rotAngle)
    @printf(io, "   slip:              %+.16e\n",struct.slip)
    @printf(io, "   steeringAngle:     %+.16e\n",struct.steeringAngle)
    @printf(io, "   spare1:            %s\n", hex(struct.spare1))
end
Base.sizeof(::RDB_WHEEL_BASE_t) = 44
Base.sizeof(::Type{RDB_WHEEL_BASE_t}) = 44

function Base.read(io::IO, ::Type{RDB_WHEEL_EXT_t})
    vAngular = read(io, Cfloat)
    forceZ = read(io, Cfloat)
    forceLat = read(io, Cfloat)
    forceLong = read(io, Cfloat)
    forceTireWheelXYZ = (read(io, Cfloat), read(io, Cfloat), read(io, Cfloat))
    radiusDynamic = read(io, Cfloat)
    brakePressure = read(io, Cfloat)
    torqueDriveShaft = read(io, Cfloat)
    damperSpeed = read(io, Cfloat)
    spare2 = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_WHEEL_EXT_t(vAngular, forceZ, forceLat, forceLong, forceTireWheelXYZ, radiusDynamic, brakePressure, torqueDriveShaft, damperSpeed, spare2)
end
function Base.read!(io::IO, struct::RDB_WHEEL_EXT_t)
    struct.vAngular = read(io, Cfloat)
    struct.forceZ = read(io, Cfloat)
    struct.forceLat = read(io, Cfloat)
    struct.forceLong = read(io, Cfloat)
    struct.forceTireWheelXYZ = (read(io, Cfloat), read(io, Cfloat), read(io, Cfloat))
    struct.radiusDynamic = read(io, Cfloat)
    struct.brakePressure = read(io, Cfloat)
    struct.torqueDriveShaft = read(io, Cfloat)
    struct.damperSpeed = read(io, Cfloat)
    struct.spare2 = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_WHEEL_EXT_t)
    write(io, struct.vAngular)
    write(io, struct.forceZ)
    write(io, struct.forceLat)
    write(io, struct.forceLong)
    write(io, struct.forceTireWheelXYZ)
    write(io, struct.radiusDynamic)
    write(io, struct.brakePressure)
    write(io, struct.torqueDriveShaft)
    write(io, struct.damperSpeed)
    write(io, struct.spare2)
end
function Base.show(io::IO, struct::RDB_WHEEL_EXT_t)
    println(io, "RDB_WHEEL_EXT_t:")
    @printf(io, "   vAngular:          %+.16e\n",struct.vAngular)
    @printf(io, "   forceZ:            %+.16e\n",struct.forceZ)
    @printf(io, "   forceLat:          %+.16e\n",struct.forceLat)
    @printf(io, "   forceLong:         %+.16e\n",struct.forceLong)
    @printf(io, "   forceTireWheelXYZ: %s\n", hex(struct.forceTireWheelXYZ))
    @printf(io, "   radiusDynamic:     %+.16e\n",struct.radiusDynamic)
    @printf(io, "   brakePressure:     %+.16e\n",struct.brakePressure)
    @printf(io, "   torqueDriveShaft:  %+.16e\n",struct.torqueDriveShaft)
    @printf(io, "   damperSpeed:       %+.16e\n",struct.damperSpeed)
    @printf(io, "   spare2:            %s\n", hex(struct.spare2))
end
Base.sizeof(::RDB_WHEEL_EXT_t) = 60
Base.sizeof(::Type{RDB_WHEEL_EXT_t}) = 60

function Base.read(io::IO, ::Type{RDB_WHEEL_t})
    base = read(io, RDB_WHEEL_BASE_t)
    ext = read(io, RDB_WHEEL_EXT_t)
    RDB_WHEEL_t(base, ext)
end
function Base.read!(io::IO, struct::RDB_WHEEL_t)
    struct.base = read(io, RDB_WHEEL_BASE_t)
    struct.ext = read(io, RDB_WHEEL_EXT_t)
    struct
end
function Base.write(io::IO, struct::RDB_WHEEL_t)
    write(io, struct.base)
    write(io, struct.ext)
end
function Base.show(io::IO, struct::RDB_WHEEL_t)
    println(io, "RDB_WHEEL_t:")
    @printf(io, "   base: RDB_WHEEL_BASE_t\n")
    @printf(io, "   ext:  RDB_WHEEL_EXT_t\n")
end

function Base.read(io::IO, ::Type{RDB_VEHICLE_SYSTEMS_t})
    playerId = read(io, UInt32)
    lightMask = read(io, UInt32)
    steering = read(io, Cfloat)
    steeringWheelTorque = read(io, Cfloat)
    accMask = read(io, UInt8)
    accSpeed = read(io, UInt8)
    batteryState = read(io, UInt8)
    batteryRate = read(io, Int8)
    displayLightMask = read(io, UInt16)
    spare0 = read(io, UInt16)
    spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_VEHICLE_SYSTEMS_t(playerId, lightMask, steering, steeringWheelTorque, accMask, accSpeed, batteryState, batteryRate, displayLightMask, spare0, spare)
end
function Base.read!(io::IO, struct::RDB_VEHICLE_SYSTEMS_t)
    struct.playerId = read(io, UInt32)
    struct.lightMask = read(io, UInt32)
    struct.steering = read(io, Cfloat)
    struct.steeringWheelTorque = read(io, Cfloat)
    struct.accMask = read(io, UInt8)
    struct.accSpeed = read(io, UInt8)
    struct.batteryState = read(io, UInt8)
    struct.batteryRate = read(io, Int8)
    struct.displayLightMask = read(io, UInt16)
    struct.spare0 = read(io, UInt16)
    struct.spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_VEHICLE_SYSTEMS_t)
    write(io, struct.playerId)
    write(io, struct.lightMask)
    write(io, struct.steering)
    write(io, struct.steeringWheelTorque)
    write(io, struct.accMask)
    write(io, struct.accSpeed)
    write(io, struct.batteryState)
    write(io, struct.batteryRate)
    write(io, struct.displayLightMask)
    write(io, struct.spare0)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_VEHICLE_SYSTEMS_t)
    println(io, "RDB_VEHICLE_SYSTEMS_t:")
    @printf(io, "   playerId:            %s\n", hex(struct.playerId))
    @printf(io, "   lightMask:           %s\n", hex(struct.lightMask))
    @printf(io, "   steering:            %+.16e\n",struct.steering)
    @printf(io, "   steeringWheelTorque: %+.16e\n",struct.steeringWheelTorque)
    @printf(io, "   accMask:             %s\n", hex(struct.accMask))
    @printf(io, "   accSpeed:            %s\n", hex(struct.accSpeed))
    @printf(io, "   batteryState:        %s\n", hex(struct.batteryState))
    @printf(io, "   batteryRate:         %d\n",struct.batteryRate)
    @printf(io, "   displayLightMask:    %s\n", hex(struct.displayLightMask))
    @printf(io, "   spare0:              %s\n", hex(struct.spare0))
    @printf(io, "   spare:               %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_VEHICLE_SYSTEMS_t) = 44
Base.sizeof(::Type{RDB_VEHICLE_SYSTEMS_t}) = 44

function Base.read(io::IO, ::Type{RDB_VEHICLE_SETUP_t})
    playerId = read(io, UInt32)
    mass = read(io, Cfloat)
    wheelBase = read(io, Cfloat)
    spare = (read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32))
    RDB_VEHICLE_SETUP_t(playerId, mass, wheelBase, spare)
end
function Base.read!(io::IO, struct::RDB_VEHICLE_SETUP_t)
    struct.playerId = read(io, UInt32)
    struct.mass = read(io, Cfloat)
    struct.wheelBase = read(io, Cfloat)
    struct.spare = (read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32))
    struct
end
function Base.write(io::IO, struct::RDB_VEHICLE_SETUP_t)
    write(io, struct.playerId)
    write(io, struct.mass)
    write(io, struct.wheelBase)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_VEHICLE_SETUP_t)
    println(io, "RDB_VEHICLE_SETUP_t:")
    @printf(io, "   playerId:  %s\n", hex(struct.playerId))
    @printf(io, "   mass:      %+.16e\n",struct.mass)
    @printf(io, "   wheelBase: %+.16e\n",struct.wheelBase)
    @printf(io, "   spare:     %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_VEHICLE_SETUP_t) = 28
Base.sizeof(::Type{RDB_VEHICLE_SETUP_t}) = 28

function Base.read(io::IO, ::Type{RDB_IMAGE_t})
    id = read(io, UInt32)
    width = read(io, UInt16)
    height = read(io, UInt16)
    pixelSize = read(io, UInt8)
    pixelFormat = read(io, UInt8)
    cameraId = read(io, UInt16)
    imgSize = read(io, UInt32)
    color = (read(io, UInt8), read(io, UInt8), read(io, UInt8), read(io, UInt8))
    spare1 = (read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_IMAGE_t(id, width, height, pixelSize, pixelFormat, cameraId, imgSize, color, spare1)
end
function Base.read!(io::IO, struct::RDB_IMAGE_t)
    struct.id = read(io, UInt32)
    struct.width = read(io, UInt16)
    struct.height = read(io, UInt16)
    struct.pixelSize = read(io, UInt8)
    struct.pixelFormat = read(io, UInt8)
    struct.cameraId = read(io, UInt16)
    struct.imgSize = read(io, UInt32)
    struct.color = (read(io, UInt8), read(io, UInt8), read(io, UInt8), read(io, UInt8))
    struct.spare1 = (read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_IMAGE_t)
    write(io, struct.id)
    write(io, struct.width)
    write(io, struct.height)
    write(io, struct.pixelSize)
    write(io, struct.pixelFormat)
    write(io, struct.cameraId)
    write(io, struct.imgSize)
    write(io, struct.color)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_IMAGE_t)
    println(io, "RDB_IMAGE_t:")
    @printf(io, "   id:          %s\n", hex(struct.id))
    @printf(io, "   width:       %s\n", hex(struct.width))
    @printf(io, "   height:      %s\n", hex(struct.height))
    @printf(io, "   pixelSize:   %s\n", hex(struct.pixelSize))
    @printf(io, "   pixelFormat: %s\n", hex(struct.pixelFormat))
    @printf(io, "   cameraId:    %s\n", hex(struct.cameraId))
    @printf(io, "   imgSize:     %s\n", hex(struct.imgSize))
    @printf(io, "   color:       %s\n", hex(struct.color))
    @printf(io, "   spare1:      %s\n", hex(struct.spare1))
end
Base.sizeof(::RDB_IMAGE_t) = 32
Base.sizeof(::Type{RDB_IMAGE_t}) = 32

function Base.read(io::IO, ::Type{RDB_FUNCTION_t})
    id = read(io, UInt32)
    thetype = read(io, UInt8)
    dimension = read(io, UInt8)
    spare = read(io, UInt16)
    dataSize = read(io, UInt32)
    spare1 = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_FUNCTION_t(id, thetype, dimension, spare, dataSize, spare1)
end
function Base.read!(io::IO, struct::RDB_FUNCTION_t)
    struct.id = read(io, UInt32)
    struct.thetype = read(io, UInt8)
    struct.dimension = read(io, UInt8)
    struct.spare = read(io, UInt16)
    struct.dataSize = read(io, UInt32)
    struct.spare1 = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_FUNCTION_t)
    write(io, struct.id)
    write(io, struct.thetype)
    write(io, struct.dimension)
    write(io, struct.spare)
    write(io, struct.dataSize)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_FUNCTION_t)
    println(io, "RDB_FUNCTION_t:")
    @printf(io, "   id:        %s\n", hex(struct.id))
    @printf(io, "   thetype:   %s\n", hex(struct.thetype))
    @printf(io, "   dimension: %s\n", hex(struct.dimension))
    @printf(io, "   spare:     %s\n", hex(struct.spare))
    @printf(io, "   dataSize:  %s\n", hex(struct.dataSize))
    @printf(io, "   spare1:    %s\n", hex(struct.spare1))
end
Base.sizeof(::RDB_FUNCTION_t) = 28
Base.sizeof(::Type{RDB_FUNCTION_t}) = 28

function Base.read(io::IO, ::Type{RDB_SENSOR_STATE_t})
    id = read(io, UInt32)
    thetype = read(io, UInt8)
    hostCategory = read(io, UInt8)
    spare0 = read(io, UInt16)
    hostId = read(io, UInt32)
    fovHV = (read(io, Cfloat), read(io, Cfloat))
    clipNF = (read(io, Cfloat), read(io, Cfloat))
    pos = read(io, RDB_COORD_t)
    originCoordSys = read(io, RDB_COORD_t)
    spare = (read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32))
    RDB_SENSOR_STATE_t(id, thetype, hostCategory, spare0, hostId, fovHV, clipNF, pos, originCoordSys, spare)
end
function Base.read!(io::IO, struct::RDB_SENSOR_STATE_t)
    struct.id = read(io, UInt32)
    struct.thetype = read(io, UInt8)
    struct.hostCategory = read(io, UInt8)
    struct.spare0 = read(io, UInt16)
    struct.hostId = read(io, UInt32)
    struct.fovHV = (read(io, Cfloat), read(io, Cfloat))
    struct.clipNF = (read(io, Cfloat), read(io, Cfloat))
    struct.pos = read(io, RDB_COORD_t)
    struct.originCoordSys = read(io, RDB_COORD_t)
    struct.spare = (read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32))
    struct
end
function Base.write(io::IO, struct::RDB_SENSOR_STATE_t)
    write(io, struct.id)
    write(io, struct.thetype)
    write(io, struct.hostCategory)
    write(io, struct.spare0)
    write(io, struct.hostId)
    write(io, struct.fovHV)
    write(io, struct.clipNF)
    write(io, struct.pos)
    write(io, struct.originCoordSys)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_SENSOR_STATE_t)
    println(io, "RDB_SENSOR_STATE_t:")
    @printf(io, "   id:             %s\n", hex(struct.id))
    @printf(io, "   thetype:        %s\n", hex(struct.thetype))
    @printf(io, "   hostCategory:   %s\n", hex(struct.hostCategory))
    @printf(io, "   spare0:         %s\n", hex(struct.spare0))
    @printf(io, "   hostId:         %s\n", hex(struct.hostId))
    @printf(io, "   fovHV:          %s\n", hex(struct.fovHV))
    @printf(io, "   clipNF:         %s\n", hex(struct.clipNF))
    @printf(io, "   pos:            RDB_COORD_t\n")
    @printf(io, "   originCoordSys: RDB_COORD_t\n")
    @printf(io, "   spare:          %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_SENSOR_STATE_t) = 132
Base.sizeof(::Type{RDB_SENSOR_STATE_t}) = 132

function Base.read(io::IO, ::Type{RDB_SENSOR_OBJECT_t})
    category = read(io, UInt8)
    thetype = read(io, UInt8)
    flags = read(io, UInt16)
    id = read(io, UInt32)
    sensorId = read(io, UInt32)
    dist = read(io, Cdouble)
    sensorPos = read(io, RDB_COORD_t)
    occlusion = read(io, Int8)
    spare0 = (read(io, UInt8), read(io, UInt8), read(io, UInt8))
    spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_SENSOR_OBJECT_t(category, thetype, flags, id, sensorId, dist, sensorPos, occlusion, spare0, spare)
end
function Base.read!(io::IO, struct::RDB_SENSOR_OBJECT_t)
    struct.category = read(io, UInt8)
    struct.thetype = read(io, UInt8)
    struct.flags = read(io, UInt16)
    struct.id = read(io, UInt32)
    struct.sensorId = read(io, UInt32)
    struct.dist = read(io, Cdouble)
    struct.sensorPos = read(io, RDB_COORD_t)
    struct.occlusion = read(io, Int8)
    struct.spare0 = (read(io, UInt8), read(io, UInt8), read(io, UInt8))
    struct.spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_SENSOR_OBJECT_t)
    write(io, struct.category)
    write(io, struct.thetype)
    write(io, struct.flags)
    write(io, struct.id)
    write(io, struct.sensorId)
    write(io, struct.dist)
    write(io, struct.sensorPos)
    write(io, struct.occlusion)
    write(io, struct.spare0)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_SENSOR_OBJECT_t)
    println(io, "RDB_SENSOR_OBJECT_t:")
    @printf(io, "   category:  %s\n", hex(struct.category))
    @printf(io, "   thetype:   %s\n", hex(struct.thetype))
    @printf(io, "   flags:     %s\n", hex(struct.flags))
    @printf(io, "   id:        %s\n", hex(struct.id))
    @printf(io, "   sensorId:  %s\n", hex(struct.sensorId))
    @printf(io, "   dist:      %+.16e\n",struct.dist)
    @printf(io, "   sensorPos: RDB_COORD_t\n")
    @printf(io, "   occlusion: %d\n",struct.occlusion)
    @printf(io, "   spare0:    %s\n", hex(struct.spare0))
    @printf(io, "   spare:     %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_SENSOR_OBJECT_t) = 80
Base.sizeof(::Type{RDB_SENSOR_OBJECT_t}) = 80

function Base.read(io::IO, ::Type{RDB_CAMERA_t})
    id = read(io, UInt16)
    width = read(io, UInt16)
    height = read(io, UInt16)
    spare0 = read(io, UInt16)
    clipNear = read(io, Cfloat)
    clipFar = read(io, Cfloat)
    focalX = read(io, Cfloat)
    focalY = read(io, Cfloat)
    principalX = read(io, Cfloat)
    principalY = read(io, Cfloat)
    pos = read(io, RDB_COORD_t)
    spare1 = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_CAMERA_t(id, width, height, spare0, clipNear, clipFar, focalX, focalY, principalX, principalY, pos, spare1)
end
function Base.read!(io::IO, struct::RDB_CAMERA_t)
    struct.id = read(io, UInt16)
    struct.width = read(io, UInt16)
    struct.height = read(io, UInt16)
    struct.spare0 = read(io, UInt16)
    struct.clipNear = read(io, Cfloat)
    struct.clipFar = read(io, Cfloat)
    struct.focalX = read(io, Cfloat)
    struct.focalY = read(io, Cfloat)
    struct.principalX = read(io, Cfloat)
    struct.principalY = read(io, Cfloat)
    struct.pos = read(io, RDB_COORD_t)
    struct.spare1 = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_CAMERA_t)
    write(io, struct.id)
    write(io, struct.width)
    write(io, struct.height)
    write(io, struct.spare0)
    write(io, struct.clipNear)
    write(io, struct.clipFar)
    write(io, struct.focalX)
    write(io, struct.focalY)
    write(io, struct.principalX)
    write(io, struct.principalY)
    write(io, struct.pos)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_CAMERA_t)
    println(io, "RDB_CAMERA_t:")
    @printf(io, "   id:         %s\n", hex(struct.id))
    @printf(io, "   width:      %s\n", hex(struct.width))
    @printf(io, "   height:     %s\n", hex(struct.height))
    @printf(io, "   spare0:     %s\n", hex(struct.spare0))
    @printf(io, "   clipNear:   %+.16e\n",struct.clipNear)
    @printf(io, "   clipFar:    %+.16e\n",struct.clipFar)
    @printf(io, "   focalX:     %+.16e\n",struct.focalX)
    @printf(io, "   focalY:     %+.16e\n",struct.focalY)
    @printf(io, "   principalX: %+.16e\n",struct.principalX)
    @printf(io, "   principalY: %+.16e\n",struct.principalY)
    @printf(io, "   pos:        RDB_COORD_t\n")
    @printf(io, "   spare1:     %s\n", hex(struct.spare1))
end
Base.sizeof(::RDB_CAMERA_t) = 92
Base.sizeof(::Type{RDB_CAMERA_t}) = 92

function Base.read(io::IO, ::Type{RDB_LIGHT_SOURCE_BASE_t})
    id = read(io, UInt16)
    templateId = read(io, Int8)
    state = read(io, UInt8)
    playerId = read(io, Int32)
    pos = read(io, RDB_COORD_t)
    flags = read(io, UInt16)
    spare0 = read(io, UInt16)
    spare1 = (read(io, Int32), read(io, Int32))
    RDB_LIGHT_SOURCE_BASE_t(id, templateId, state, playerId, pos, flags, spare0, spare1)
end
function Base.read!(io::IO, struct::RDB_LIGHT_SOURCE_BASE_t)
    struct.id = read(io, UInt16)
    struct.templateId = read(io, Int8)
    struct.state = read(io, UInt8)
    struct.playerId = read(io, Int32)
    struct.pos = read(io, RDB_COORD_t)
    struct.flags = read(io, UInt16)
    struct.spare0 = read(io, UInt16)
    struct.spare1 = (read(io, Int32), read(io, Int32))
    struct
end
function Base.write(io::IO, struct::RDB_LIGHT_SOURCE_BASE_t)
    write(io, struct.id)
    write(io, struct.templateId)
    write(io, struct.state)
    write(io, struct.playerId)
    write(io, struct.pos)
    write(io, struct.flags)
    write(io, struct.spare0)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_LIGHT_SOURCE_BASE_t)
    println(io, "RDB_LIGHT_SOURCE_BASE_t:")
    @printf(io, "   id:         %s\n", hex(struct.id))
    @printf(io, "   templateId: %d\n",struct.templateId)
    @printf(io, "   state:      %s\n", hex(struct.state))
    @printf(io, "   playerId:   %d\n",struct.playerId)
    @printf(io, "   pos:        RDB_COORD_t\n")
    @printf(io, "   flags:      %s\n", hex(struct.flags))
    @printf(io, "   spare0:     %s\n", hex(struct.spare0))
    @printf(io, "   spare1:     %s\n", hex(struct.spare1))
end
Base.sizeof(::RDB_LIGHT_SOURCE_BASE_t) = 64
Base.sizeof(::Type{RDB_LIGHT_SOURCE_BASE_t}) = 64

function Base.read(io::IO, ::Type{RDB_LIGHT_SOURCE_EXT_t})
    nearFar = (read(io, Cfloat), read(io, Cfloat))
    frustumLRBT = (read(io, Cfloat), read(io, Cfloat), read(io, Cfloat), read(io, Cfloat))
    intensity = (read(io, Cfloat), read(io, Cfloat), read(io, Cfloat))
    atten = (read(io, Cfloat), read(io, Cfloat), read(io, Cfloat))
    spare1 = (read(io, Int32), read(io, Int32), read(io, Int32))
    RDB_LIGHT_SOURCE_EXT_t(nearFar, frustumLRBT, intensity, atten, spare1)
end
function Base.read!(io::IO, struct::RDB_LIGHT_SOURCE_EXT_t)
    struct.nearFar = (read(io, Cfloat), read(io, Cfloat))
    struct.frustumLRBT = (read(io, Cfloat), read(io, Cfloat), read(io, Cfloat), read(io, Cfloat))
    struct.intensity = (read(io, Cfloat), read(io, Cfloat), read(io, Cfloat))
    struct.atten = (read(io, Cfloat), read(io, Cfloat), read(io, Cfloat))
    struct.spare1 = (read(io, Int32), read(io, Int32), read(io, Int32))
    struct
end
function Base.write(io::IO, struct::RDB_LIGHT_SOURCE_EXT_t)
    write(io, struct.nearFar)
    write(io, struct.frustumLRBT)
    write(io, struct.intensity)
    write(io, struct.atten)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_LIGHT_SOURCE_EXT_t)
    println(io, "RDB_LIGHT_SOURCE_EXT_t:")
    @printf(io, "   nearFar:     %s\n", hex(struct.nearFar))
    @printf(io, "   frustumLRBT: %s\n", hex(struct.frustumLRBT))
    @printf(io, "   intensity:   %s\n", hex(struct.intensity))
    @printf(io, "   atten:       %s\n", hex(struct.atten))
    @printf(io, "   spare1:      %s\n", hex(struct.spare1))
end
Base.sizeof(::RDB_LIGHT_SOURCE_EXT_t) = 60
Base.sizeof(::Type{RDB_LIGHT_SOURCE_EXT_t}) = 60

function Base.read(io::IO, ::Type{RDB_LIGHT_SOURCE_t})
    base = read(io, RDB_LIGHT_SOURCE_BASE_t)
    ext = read(io, RDB_LIGHT_SOURCE_EXT_t)
    RDB_LIGHT_SOURCE_t(base, ext)
end
function Base.read!(io::IO, struct::RDB_LIGHT_SOURCE_t)
    struct.base = read(io, RDB_LIGHT_SOURCE_BASE_t)
    struct.ext = read(io, RDB_LIGHT_SOURCE_EXT_t)
    struct
end
function Base.write(io::IO, struct::RDB_LIGHT_SOURCE_t)
    write(io, struct.base)
    write(io, struct.ext)
end
function Base.show(io::IO, struct::RDB_LIGHT_SOURCE_t)
    println(io, "RDB_LIGHT_SOURCE_t:")
    @printf(io, "   base: RDB_LIGHT_SOURCE_BASE_t\n")
    @printf(io, "   ext:  RDB_LIGHT_SOURCE_EXT_t\n")
end

function Base.read(io::IO, ::Type{RDB_CONTACT_POINT_t})
    id = read(io, UInt16)
    flags = read(io, UInt16)
    roadDataIn = read(io, RDB_COORD_t)
    friction = read(io, Cfloat)
    playerId = read(io, Int32)
    spare1 = read(io, Int32)
    RDB_CONTACT_POINT_t(id, flags, roadDataIn, friction, playerId, spare1)
end
function Base.read!(io::IO, struct::RDB_CONTACT_POINT_t)
    struct.id = read(io, UInt16)
    struct.flags = read(io, UInt16)
    struct.roadDataIn = read(io, RDB_COORD_t)
    struct.friction = read(io, Cfloat)
    struct.playerId = read(io, Int32)
    struct.spare1 = read(io, Int32)
    struct
end
function Base.write(io::IO, struct::RDB_CONTACT_POINT_t)
    write(io, struct.id)
    write(io, struct.flags)
    write(io, struct.roadDataIn)
    write(io, struct.friction)
    write(io, struct.playerId)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_CONTACT_POINT_t)
    println(io, "RDB_CONTACT_POINT_t:")
    @printf(io, "   id:         %s\n", hex(struct.id))
    @printf(io, "   flags:      %s\n", hex(struct.flags))
    @printf(io, "   roadDataIn: RDB_COORD_t\n")
    @printf(io, "   friction:   %+.16e\n",struct.friction)
    @printf(io, "   playerId:   %d\n",struct.playerId)
    @printf(io, "   spare1:     %d\n",struct.spare1)
end

function Base.read(io::IO, ::Type{RDB_TRAFFIC_SIGN_t})
    id = read(io, UInt32)
    playerId = read(io, UInt32)
    roadDist = read(io, Cfloat)
    pos = read(io, RDB_COORD_t)
    thetype = read(io, Int32)
    subType = read(io, Int32)
    value = read(io, Cfloat)
    state = read(io, UInt32)
    readability = read(io, Int8)
    occlusion = read(io, Int8)
    spare0 = read(io, UInt16)
    addOnId = read(io, UInt32)
    minLane = read(io, Int8)
    maxLane = read(io, Int8)
    spare = read(io, UInt16)
    RDB_TRAFFIC_SIGN_t(id, playerId, roadDist, pos, thetype, subType, value, state, readability, occlusion, spare0, addOnId, minLane, maxLane, spare)
end
function Base.read!(io::IO, struct::RDB_TRAFFIC_SIGN_t)
    struct.id = read(io, UInt32)
    struct.playerId = read(io, UInt32)
    struct.roadDist = read(io, Cfloat)
    struct.pos = read(io, RDB_COORD_t)
    struct.thetype = read(io, Int32)
    struct.subType = read(io, Int32)
    struct.value = read(io, Cfloat)
    struct.state = read(io, UInt32)
    struct.readability = read(io, Int8)
    struct.occlusion = read(io, Int8)
    struct.spare0 = read(io, UInt16)
    struct.addOnId = read(io, UInt32)
    struct.minLane = read(io, Int8)
    struct.maxLane = read(io, Int8)
    struct.spare = read(io, UInt16)
    struct
end
function Base.write(io::IO, struct::RDB_TRAFFIC_SIGN_t)
    write(io, struct.id)
    write(io, struct.playerId)
    write(io, struct.roadDist)
    write(io, struct.pos)
    write(io, struct.thetype)
    write(io, struct.subType)
    write(io, struct.value)
    write(io, struct.state)
    write(io, struct.readability)
    write(io, struct.occlusion)
    write(io, struct.spare0)
    write(io, struct.addOnId)
    write(io, struct.minLane)
    write(io, struct.maxLane)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_TRAFFIC_SIGN_t)
    println(io, "RDB_TRAFFIC_SIGN_t:")
    @printf(io, "   id:          %s\n", hex(struct.id))
    @printf(io, "   playerId:    %s\n", hex(struct.playerId))
    @printf(io, "   roadDist:    %+.16e\n",struct.roadDist)
    @printf(io, "   pos:         RDB_COORD_t\n")
    @printf(io, "   thetype:     %d\n",struct.thetype)
    @printf(io, "   subType:     %d\n",struct.subType)
    @printf(io, "   value:       %+.16e\n",struct.value)
    @printf(io, "   state:       %s\n", hex(struct.state))
    @printf(io, "   readability: %d\n",struct.readability)
    @printf(io, "   occlusion:   %d\n",struct.occlusion)
    @printf(io, "   spare0:      %s\n", hex(struct.spare0))
    @printf(io, "   addOnId:     %s\n", hex(struct.addOnId))
    @printf(io, "   minLane:     %d\n",struct.minLane)
    @printf(io, "   maxLane:     %d\n",struct.maxLane)
    @printf(io, "   spare:       %s\n", hex(struct.spare))
end

function Base.read(io::IO, ::Type{RDB_ROAD_STATE_t})
    playerId = read(io, UInt32)
    wheelId = read(io, Int8)
    spare0 = read(io, UInt8)
    spare1 = read(io, UInt16)
    roadId = read(io, UInt32)
    defaultSpeed = read(io, Cfloat)
    waterLevel = read(io, Cfloat)
    eventMask = read(io, UInt32)
    spare2 = (read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32))
    RDB_ROAD_STATE_t(playerId, wheelId, spare0, spare1, roadId, defaultSpeed, waterLevel, eventMask, spare2)
end
function Base.read!(io::IO, struct::RDB_ROAD_STATE_t)
    struct.playerId = read(io, UInt32)
    struct.wheelId = read(io, Int8)
    struct.spare0 = read(io, UInt8)
    struct.spare1 = read(io, UInt16)
    struct.roadId = read(io, UInt32)
    struct.defaultSpeed = read(io, Cfloat)
    struct.waterLevel = read(io, Cfloat)
    struct.eventMask = read(io, UInt32)
    struct.spare2 = (read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32), read(io, Int32))
    struct
end
function Base.write(io::IO, struct::RDB_ROAD_STATE_t)
    write(io, struct.playerId)
    write(io, struct.wheelId)
    write(io, struct.spare0)
    write(io, struct.spare1)
    write(io, struct.roadId)
    write(io, struct.defaultSpeed)
    write(io, struct.waterLevel)
    write(io, struct.eventMask)
    write(io, struct.spare2)
end
function Base.show(io::IO, struct::RDB_ROAD_STATE_t)
    println(io, "RDB_ROAD_STATE_t:")
    @printf(io, "   playerId:     %s\n", hex(struct.playerId))
    @printf(io, "   wheelId:      %d\n",struct.wheelId)
    @printf(io, "   spare0:       %s\n", hex(struct.spare0))
    @printf(io, "   spare1:       %s\n", hex(struct.spare1))
    @printf(io, "   roadId:       %s\n", hex(struct.roadId))
    @printf(io, "   defaultSpeed: %+.16e\n",struct.defaultSpeed)
    @printf(io, "   waterLevel:   %+.16e\n",struct.waterLevel)
    @printf(io, "   eventMask:    %s\n", hex(struct.eventMask))
    @printf(io, "   spare2:       %s\n", hex(struct.spare2))
end
Base.sizeof(::RDB_ROAD_STATE_t) = 72
Base.sizeof(::Type{RDB_ROAD_STATE_t}) = 72

function Base.read(io::IO, ::Type{RDB_ENVIRONMENT_t})
    visibility = read(io, Cfloat)
    timeOfDay = read(io, UInt32)
    brightness = read(io, Cfloat)
    precipitation = read(io, UInt8)
    cloudState = read(io, UInt8)
    flags = read(io, UInt16)
    spare1 = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_ENVIRONMENT_t(visibility, timeOfDay, brightness, precipitation, cloudState, flags, spare1)
end
function Base.read!(io::IO, struct::RDB_ENVIRONMENT_t)
    struct.visibility = read(io, Cfloat)
    struct.timeOfDay = read(io, UInt32)
    struct.brightness = read(io, Cfloat)
    struct.precipitation = read(io, UInt8)
    struct.cloudState = read(io, UInt8)
    struct.flags = read(io, UInt16)
    struct.spare1 = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_ENVIRONMENT_t)
    write(io, struct.visibility)
    write(io, struct.timeOfDay)
    write(io, struct.brightness)
    write(io, struct.precipitation)
    write(io, struct.cloudState)
    write(io, struct.flags)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_ENVIRONMENT_t)
    println(io, "RDB_ENVIRONMENT_t:")
    @printf(io, "   visibility:    %+.16e\n",struct.visibility)
    @printf(io, "   timeOfDay:     %s\n", hex(struct.timeOfDay))
    @printf(io, "   brightness:    %+.16e\n",struct.brightness)
    @printf(io, "   precipitation: %s\n", hex(struct.precipitation))
    @printf(io, "   cloudState:    %s\n", hex(struct.cloudState))
    @printf(io, "   flags:         %s\n", hex(struct.flags))
    @printf(io, "   spare1:        %s\n", hex(struct.spare1))
end
Base.sizeof(::RDB_ENVIRONMENT_t) = 48
Base.sizeof(::Type{RDB_ENVIRONMENT_t}) = 48

function Base.read(io::IO, ::Type{RDB_PED_ANIMATION_t})
    playerId = read(io, UInt32)
    pos = read(io, RDB_COORD_t)
    spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    noCoords = read(io, UInt32)
    dataSize = read(io, UInt32)
    RDB_PED_ANIMATION_t(playerId, pos, spare, noCoords, dataSize)
end
function Base.read!(io::IO, struct::RDB_PED_ANIMATION_t)
    struct.playerId = read(io, UInt32)
    struct.pos = read(io, RDB_COORD_t)
    struct.spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct.noCoords = read(io, UInt32)
    struct.dataSize = read(io, UInt32)
    struct
end
function Base.write(io::IO, struct::RDB_PED_ANIMATION_t)
    write(io, struct.playerId)
    write(io, struct.pos)
    write(io, struct.spare)
    write(io, struct.noCoords)
    write(io, struct.dataSize)
end
function Base.show(io::IO, struct::RDB_PED_ANIMATION_t)
    println(io, "RDB_PED_ANIMATION_t:")
    @printf(io, "   playerId: %s\n", hex(struct.playerId))
    @printf(io, "   pos:      RDB_COORD_t\n")
    @printf(io, "   spare:    %s\n", hex(struct.spare))
    @printf(io, "   noCoords: %s\n", hex(struct.noCoords))
    @printf(io, "   dataSize: %s\n", hex(struct.dataSize))
end
Base.sizeof(::RDB_PED_ANIMATION_t) = 72
Base.sizeof(::Type{RDB_PED_ANIMATION_t}) = 72

function Base.read(io::IO, ::Type{RDB_CUSTOM_SCORING_t})
    playerId = read(io, UInt32)
    pathS = read(io, Cfloat)
    roadS = read(io, Cfloat)
    fuelCurrent = read(io, Cfloat)
    fuelAverage = read(io, Cfloat)
    stateFlags = read(io, UInt32)
    slip = read(io, Cfloat)
    spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_CUSTOM_SCORING_t(playerId, pathS, roadS, fuelCurrent, fuelAverage, stateFlags, slip, spare)
end
function Base.read!(io::IO, struct::RDB_CUSTOM_SCORING_t)
    struct.playerId = read(io, UInt32)
    struct.pathS = read(io, Cfloat)
    struct.roadS = read(io, Cfloat)
    struct.fuelCurrent = read(io, Cfloat)
    struct.fuelAverage = read(io, Cfloat)
    struct.stateFlags = read(io, UInt32)
    struct.slip = read(io, Cfloat)
    struct.spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_CUSTOM_SCORING_t)
    write(io, struct.playerId)
    write(io, struct.pathS)
    write(io, struct.roadS)
    write(io, struct.fuelCurrent)
    write(io, struct.fuelAverage)
    write(io, struct.stateFlags)
    write(io, struct.slip)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_CUSTOM_SCORING_t)
    println(io, "RDB_CUSTOM_SCORING_t:")
    @printf(io, "   playerId:    %s\n", hex(struct.playerId))
    @printf(io, "   pathS:       %+.16e\n",struct.pathS)
    @printf(io, "   roadS:       %+.16e\n",struct.roadS)
    @printf(io, "   fuelCurrent: %+.16e\n",struct.fuelCurrent)
    @printf(io, "   fuelAverage: %+.16e\n",struct.fuelAverage)
    @printf(io, "   stateFlags:  %s\n", hex(struct.stateFlags))
    @printf(io, "   slip:        %+.16e\n",struct.slip)
    @printf(io, "   spare:       %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_CUSTOM_SCORING_t) = 44
Base.sizeof(::Type{RDB_CUSTOM_SCORING_t}) = 44

function Base.read(io::IO, ::Type{RDB_TRIGGER_t})
    deltaT = read(io, Cfloat)
    frameNo = read(io, UInt32)
    spare = read(io, Int32)
    RDB_TRIGGER_t(deltaT, frameNo, spare)
end
function Base.read!(io::IO, struct::RDB_TRIGGER_t)
    struct.deltaT = read(io, Cfloat)
    struct.frameNo = read(io, UInt32)
    struct.spare = read(io, Int32)
    struct
end
function Base.write(io::IO, struct::RDB_TRIGGER_t)
    write(io, struct.deltaT)
    write(io, struct.frameNo)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_TRIGGER_t)
    println(io, "RDB_TRIGGER_t:")
    @printf(io, "   deltaT:  %+.16e\n",struct.deltaT)
    @printf(io, "   frameNo: %s\n", hex(struct.frameNo))
    @printf(io, "   spare:   %d\n",struct.spare)
end

function Base.read(io::IO, ::Type{RDB_DRIVER_CTRL_t})
    playerId = read(io, UInt32)
    steeringWheel = read(io, Cfloat)
    steeringSpeed = read(io, Cfloat)
    throttlePedal = read(io, Cfloat)
    brakePedal = read(io, Cfloat)
    clutchPedal = read(io, Cfloat)
    accelTgt = read(io, Cfloat)
    steeringTgt = read(io, Cfloat)
    curvatureTgt = read(io, Cdouble)
    steeringTorque = read(io, Cfloat)
    engineTorqueTgt = read(io, Cfloat)
    speedTgt = read(io, Cfloat)
    gear = read(io, UInt8)
    sourceId = read(io, UInt8)
    spare0 = (read(io, UInt8), read(io, UInt8))
    validityFlags = read(io, UInt32)
    flags = read(io, UInt32)
    mockupInput0 = read(io, UInt32)
    mockupInput1 = read(io, UInt32)
    mockupInput2 = read(io, UInt32)
    spare = read(io, UInt32)
    RDB_DRIVER_CTRL_t(playerId, steeringWheel, steeringSpeed, throttlePedal, brakePedal, clutchPedal, accelTgt, steeringTgt, curvatureTgt, steeringTorque, engineTorqueTgt, speedTgt, gear, sourceId, spare0, validityFlags, flags, mockupInput0, mockupInput1, mockupInput2, spare)
end
function Base.read!(io::IO, struct::RDB_DRIVER_CTRL_t)
    struct.playerId = read(io, UInt32)
    struct.steeringWheel = read(io, Cfloat)
    struct.steeringSpeed = read(io, Cfloat)
    struct.throttlePedal = read(io, Cfloat)
    struct.brakePedal = read(io, Cfloat)
    struct.clutchPedal = read(io, Cfloat)
    struct.accelTgt = read(io, Cfloat)
    struct.steeringTgt = read(io, Cfloat)
    struct.curvatureTgt = read(io, Cdouble)
    struct.steeringTorque = read(io, Cfloat)
    struct.engineTorqueTgt = read(io, Cfloat)
    struct.speedTgt = read(io, Cfloat)
    struct.gear = read(io, UInt8)
    struct.sourceId = read(io, UInt8)
    struct.spare0 = (read(io, UInt8), read(io, UInt8))
    struct.validityFlags = read(io, UInt32)
    struct.flags = read(io, UInt32)
    struct.mockupInput0 = read(io, UInt32)
    struct.mockupInput1 = read(io, UInt32)
    struct.mockupInput2 = read(io, UInt32)
    struct.spare = read(io, UInt32)
    struct
end
function Base.write(io::IO, struct::RDB_DRIVER_CTRL_t)
    write(io, struct.playerId)
    write(io, struct.steeringWheel)
    write(io, struct.steeringSpeed)
    write(io, struct.throttlePedal)
    write(io, struct.brakePedal)
    write(io, struct.clutchPedal)
    write(io, struct.accelTgt)
    write(io, struct.steeringTgt)
    write(io, struct.curvatureTgt)
    write(io, struct.steeringTorque)
    write(io, struct.engineTorqueTgt)
    write(io, struct.speedTgt)
    write(io, struct.gear)
    write(io, struct.sourceId)
    write(io, struct.spare0)
    write(io, struct.validityFlags)
    write(io, struct.flags)
    write(io, struct.mockupInput0)
    write(io, struct.mockupInput1)
    write(io, struct.mockupInput2)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_DRIVER_CTRL_t)
    println(io, "RDB_DRIVER_CTRL_t:")
    @printf(io, "   playerId:        %s\n", hex(struct.playerId))
    @printf(io, "   steeringWheel:   %+.16e\n",struct.steeringWheel)
    @printf(io, "   steeringSpeed:   %+.16e\n",struct.steeringSpeed)
    @printf(io, "   throttlePedal:   %+.16e\n",struct.throttlePedal)
    @printf(io, "   brakePedal:      %+.16e\n",struct.brakePedal)
    @printf(io, "   clutchPedal:     %+.16e\n",struct.clutchPedal)
    @printf(io, "   accelTgt:        %+.16e\n",struct.accelTgt)
    @printf(io, "   steeringTgt:     %+.16e\n",struct.steeringTgt)
    @printf(io, "   curvatureTgt:    %+.16e\n",struct.curvatureTgt)
    @printf(io, "   steeringTorque:  %+.16e\n",struct.steeringTorque)
    @printf(io, "   engineTorqueTgt: %+.16e\n",struct.engineTorqueTgt)
    @printf(io, "   speedTgt:        %+.16e\n",struct.speedTgt)
    @printf(io, "   gear:            %s\n", hex(struct.gear))
    @printf(io, "   sourceId:        %s\n", hex(struct.sourceId))
    @printf(io, "   spare0:          %s\n", hex(struct.spare0))
    @printf(io, "   validityFlags:   %s\n", hex(struct.validityFlags))
    @printf(io, "   flags:           %s\n", hex(struct.flags))
    @printf(io, "   mockupInput0:    %s\n", hex(struct.mockupInput0))
    @printf(io, "   mockupInput1:    %s\n", hex(struct.mockupInput1))
    @printf(io, "   mockupInput2:    %s\n", hex(struct.mockupInput2))
    @printf(io, "   spare:           %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_DRIVER_CTRL_t) = 80
Base.sizeof(::Type{RDB_DRIVER_CTRL_t}) = 80

function Base.read(io::IO, ::Type{RDB_DRIVER_PERCEPTION_t})
    playerId = read(io, UInt32)
    speedFromRules = read(io, Cfloat)
    distToSpeed = read(io, Cfloat)
    spare0 = (read(io, Cfloat), read(io, Cfloat), read(io, Cfloat), read(io, Cfloat))
    flags = read(io, UInt32)
    spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_DRIVER_PERCEPTION_t(playerId, speedFromRules, distToSpeed, spare0, flags, spare)
end
function Base.read!(io::IO, struct::RDB_DRIVER_PERCEPTION_t)
    struct.playerId = read(io, UInt32)
    struct.speedFromRules = read(io, Cfloat)
    struct.distToSpeed = read(io, Cfloat)
    struct.spare0 = (read(io, Cfloat), read(io, Cfloat), read(io, Cfloat), read(io, Cfloat))
    struct.flags = read(io, UInt32)
    struct.spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_DRIVER_PERCEPTION_t)
    write(io, struct.playerId)
    write(io, struct.speedFromRules)
    write(io, struct.distToSpeed)
    write(io, struct.spare0)
    write(io, struct.flags)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_DRIVER_PERCEPTION_t)
    println(io, "RDB_DRIVER_PERCEPTION_t:")
    @printf(io, "   playerId:       %s\n", hex(struct.playerId))
    @printf(io, "   speedFromRules: %+.16e\n",struct.speedFromRules)
    @printf(io, "   distToSpeed:    %+.16e\n",struct.distToSpeed)
    @printf(io, "   spare0:         %s\n", hex(struct.spare0))
    @printf(io, "   flags:          %s\n", hex(struct.flags))
    @printf(io, "   spare:          %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_DRIVER_PERCEPTION_t) = 48
Base.sizeof(::Type{RDB_DRIVER_PERCEPTION_t}) = 48

function Base.read(io::IO, ::Type{RDB_TRAFFIC_LIGHT_BASE_t})
    id = read(io, Int32)
    state = read(io, Cfloat)
    stateMask = read(io, UInt32)
    RDB_TRAFFIC_LIGHT_BASE_t(id, state, stateMask)
end
function Base.read!(io::IO, struct::RDB_TRAFFIC_LIGHT_BASE_t)
    struct.id = read(io, Int32)
    struct.state = read(io, Cfloat)
    struct.stateMask = read(io, UInt32)
    struct
end
function Base.write(io::IO, struct::RDB_TRAFFIC_LIGHT_BASE_t)
    write(io, struct.id)
    write(io, struct.state)
    write(io, struct.stateMask)
end
function Base.show(io::IO, struct::RDB_TRAFFIC_LIGHT_BASE_t)
    println(io, "RDB_TRAFFIC_LIGHT_BASE_t:")
    @printf(io, "   id:        %d\n",struct.id)
    @printf(io, "   state:     %+.16e\n",struct.state)
    @printf(io, "   stateMask: %s\n", hex(struct.stateMask))
end

function Base.read(io::IO, ::Type{RDB_TRAFFIC_LIGHT_PHASE_t})
    duration = read(io, Cfloat)
    thetype = read(io, UInt8)
    spare = (read(io, UInt8), read(io, UInt8), read(io, UInt8))
    RDB_TRAFFIC_LIGHT_PHASE_t(duration, thetype, spare)
end
function Base.read!(io::IO, struct::RDB_TRAFFIC_LIGHT_PHASE_t)
    struct.duration = read(io, Cfloat)
    struct.thetype = read(io, UInt8)
    struct.spare = (read(io, UInt8), read(io, UInt8), read(io, UInt8))
    struct
end
function Base.write(io::IO, struct::RDB_TRAFFIC_LIGHT_PHASE_t)
    write(io, struct.duration)
    write(io, struct.thetype)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_TRAFFIC_LIGHT_PHASE_t)
    println(io, "RDB_TRAFFIC_LIGHT_PHASE_t:")
    @printf(io, "   duration: %+.16e\n",struct.duration)
    @printf(io, "   thetype:  %s\n", hex(struct.thetype))
    @printf(io, "   spare:    %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_TRAFFIC_LIGHT_PHASE_t) = 8
Base.sizeof(::Type{RDB_TRAFFIC_LIGHT_PHASE_t}) = 8

function Base.read(io::IO, ::Type{RDB_TRAFFIC_LIGHT_EXT_t})
    ctrlId = read(io, Int32)
    cycleTime = read(io, Cfloat)
    noPhases = read(io, UInt16)
    dataSize = read(io, UInt32)
    RDB_TRAFFIC_LIGHT_EXT_t(ctrlId, cycleTime, noPhases, dataSize)
end
function Base.read!(io::IO, struct::RDB_TRAFFIC_LIGHT_EXT_t)
    struct.ctrlId = read(io, Int32)
    struct.cycleTime = read(io, Cfloat)
    struct.noPhases = read(io, UInt16)
    struct.dataSize = read(io, UInt32)
    struct
end
function Base.write(io::IO, struct::RDB_TRAFFIC_LIGHT_EXT_t)
    write(io, struct.ctrlId)
    write(io, struct.cycleTime)
    write(io, struct.noPhases)
    write(io, struct.dataSize)
end
function Base.show(io::IO, struct::RDB_TRAFFIC_LIGHT_EXT_t)
    println(io, "RDB_TRAFFIC_LIGHT_EXT_t:")
    @printf(io, "   ctrlId:    %d\n",struct.ctrlId)
    @printf(io, "   cycleTime: %+.16e\n",struct.cycleTime)
    @printf(io, "   noPhases:  %s\n", hex(struct.noPhases))
    @printf(io, "   dataSize:  %s\n", hex(struct.dataSize))
end

function Base.read(io::IO, ::Type{RDB_TRAFFIC_LIGHT_t})
    base = read(io, RDB_TRAFFIC_LIGHT_BASE_t)
    ext = read(io, RDB_TRAFFIC_LIGHT_EXT_t)
    RDB_TRAFFIC_LIGHT_t(base, ext)
end
function Base.read!(io::IO, struct::RDB_TRAFFIC_LIGHT_t)
    struct.base = read(io, RDB_TRAFFIC_LIGHT_BASE_t)
    struct.ext = read(io, RDB_TRAFFIC_LIGHT_EXT_t)
    struct
end
function Base.write(io::IO, struct::RDB_TRAFFIC_LIGHT_t)
    write(io, struct.base)
    write(io, struct.ext)
end
function Base.show(io::IO, struct::RDB_TRAFFIC_LIGHT_t)
    println(io, "RDB_TRAFFIC_LIGHT_t:")
    @printf(io, "   base: RDB_TRAFFIC_LIGHT_BASE_t\n")
    @printf(io, "   ext:  RDB_TRAFFIC_LIGHT_EXT_t\n")
end

function Base.read(io::IO, ::Type{RDB_SYNC_t})
    mask = read(io, UInt32)
    cmdMask = read(io, UInt32)
    systemTime = read(io, Cdouble)
    RDB_SYNC_t(mask, cmdMask, systemTime)
end
function Base.read!(io::IO, struct::RDB_SYNC_t)
    struct.mask = read(io, UInt32)
    struct.cmdMask = read(io, UInt32)
    struct.systemTime = read(io, Cdouble)
    struct
end
function Base.write(io::IO, struct::RDB_SYNC_t)
    write(io, struct.mask)
    write(io, struct.cmdMask)
    write(io, struct.systemTime)
end
function Base.show(io::IO, struct::RDB_SYNC_t)
    println(io, "RDB_SYNC_t:")
    @printf(io, "   mask:       %s\n", hex(struct.mask))
    @printf(io, "   cmdMask:    %s\n", hex(struct.cmdMask))
    @printf(io, "   systemTime: %+.16e\n",struct.systemTime)
end

function Base.read(io::IO, ::Type{RDB_ROAD_QUERY_t})
    id = read(io, UInt16)
    flags = read(io, UInt16)
    spare = (read(io, UInt16), read(io, UInt16))
    x = read(io, Cdouble)
    y = read(io, Cdouble)
    RDB_ROAD_QUERY_t(id, flags, spare, x, y)
end
function Base.read!(io::IO, struct::RDB_ROAD_QUERY_t)
    struct.id = read(io, UInt16)
    struct.flags = read(io, UInt16)
    struct.spare = (read(io, UInt16), read(io, UInt16))
    struct.x = read(io, Cdouble)
    struct.y = read(io, Cdouble)
    struct
end
function Base.write(io::IO, struct::RDB_ROAD_QUERY_t)
    write(io, struct.id)
    write(io, struct.flags)
    write(io, struct.spare)
    write(io, struct.x)
    write(io, struct.y)
end
function Base.show(io::IO, struct::RDB_ROAD_QUERY_t)
    println(io, "RDB_ROAD_QUERY_t:")
    @printf(io, "   id:    %s\n", hex(struct.id))
    @printf(io, "   flags: %s\n", hex(struct.flags))
    @printf(io, "   spare: %s\n", hex(struct.spare))
    @printf(io, "   x:     %+.16e\n",struct.x)
    @printf(io, "   y:     %+.16e\n",struct.y)
end
Base.sizeof(::RDB_ROAD_QUERY_t) = 24
Base.sizeof(::Type{RDB_ROAD_QUERY_t}) = 24

function Base.read(io::IO, ::Type{RDB_SCP_t})
    version = read(io, UInt16)
    spare = read(io, UInt16)
    dataSize = read(io, UInt32)
    RDB_SCP_t(version, spare, dataSize)
end
function Base.read!(io::IO, struct::RDB_SCP_t)
    struct.version = read(io, UInt16)
    struct.spare = read(io, UInt16)
    struct.dataSize = read(io, UInt32)
    struct
end
function Base.write(io::IO, struct::RDB_SCP_t)
    write(io, struct.version)
    write(io, struct.spare)
    write(io, struct.dataSize)
end
function Base.show(io::IO, struct::RDB_SCP_t)
    println(io, "RDB_SCP_t:")
    @printf(io, "   version:  %s\n", hex(struct.version))
    @printf(io, "   spare:    %s\n", hex(struct.spare))
    @printf(io, "   dataSize: %s\n", hex(struct.dataSize))
end

function Base.read(io::IO, ::Type{RDB_PROXY_t})
    protocol = read(io, UInt16)
    pkgId = read(io, UInt16)
    spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    dataSize = read(io, UInt32)
    RDB_PROXY_t(protocol, pkgId, spare, dataSize)
end
function Base.read!(io::IO, struct::RDB_PROXY_t)
    struct.protocol = read(io, UInt16)
    struct.pkgId = read(io, UInt16)
    struct.spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct.dataSize = read(io, UInt32)
    struct
end
function Base.write(io::IO, struct::RDB_PROXY_t)
    write(io, struct.protocol)
    write(io, struct.pkgId)
    write(io, struct.spare)
    write(io, struct.dataSize)
end
function Base.show(io::IO, struct::RDB_PROXY_t)
    println(io, "RDB_PROXY_t:")
    @printf(io, "   protocol: %s\n", hex(struct.protocol))
    @printf(io, "   pkgId:    %s\n", hex(struct.pkgId))
    @printf(io, "   spare:    %s\n", hex(struct.spare))
    @printf(io, "   dataSize: %s\n", hex(struct.dataSize))
end
Base.sizeof(::RDB_PROXY_t) = 32
Base.sizeof(::Type{RDB_PROXY_t}) = 32

function Base.read(io::IO, ::Type{RDB_TRAJECTORY_t})
    playerId = read(io, UInt32)
    spacing = read(io, Cdouble)
    flags = read(io, UInt16)
    noDataPoints = read(io, UInt16)
    spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_TRAJECTORY_t(playerId, spacing, flags, noDataPoints, spare)
end
function Base.read!(io::IO, struct::RDB_TRAJECTORY_t)
    struct.playerId = read(io, UInt32)
    struct.spacing = read(io, Cdouble)
    struct.flags = read(io, UInt16)
    struct.noDataPoints = read(io, UInt16)
    struct.spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_TRAJECTORY_t)
    write(io, struct.playerId)
    write(io, struct.spacing)
    write(io, struct.flags)
    write(io, struct.noDataPoints)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_TRAJECTORY_t)
    println(io, "RDB_TRAJECTORY_t:")
    @printf(io, "   playerId:     %s\n", hex(struct.playerId))
    @printf(io, "   spacing:      %+.16e\n",struct.spacing)
    @printf(io, "   flags:        %s\n", hex(struct.flags))
    @printf(io, "   noDataPoints: %s\n", hex(struct.noDataPoints))
    @printf(io, "   spare:        %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_TRAJECTORY_t) = 32
Base.sizeof(::Type{RDB_TRAJECTORY_t}) = 32

function Base.read(io::IO, ::Type{RDB_MOTION_SYSTEM_t})
    playerId = read(io, UInt32)
    flags = read(io, UInt32)
    pos = read(io, RDB_COORD_t)
    speed = read(io, RDB_COORD_t)
    spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_MOTION_SYSTEM_t(playerId, flags, pos, speed, spare)
end
function Base.read!(io::IO, struct::RDB_MOTION_SYSTEM_t)
    struct.playerId = read(io, UInt32)
    struct.flags = read(io, UInt32)
    struct.pos = read(io, RDB_COORD_t)
    struct.speed = read(io, RDB_COORD_t)
    struct.spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_MOTION_SYSTEM_t)
    write(io, struct.playerId)
    write(io, struct.flags)
    write(io, struct.pos)
    write(io, struct.speed)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_MOTION_SYSTEM_t)
    println(io, "RDB_MOTION_SYSTEM_t:")
    @printf(io, "   playerId: %s\n", hex(struct.playerId))
    @printf(io, "   flags:    %s\n", hex(struct.flags))
    @printf(io, "   pos:      RDB_COORD_t\n")
    @printf(io, "   speed:    RDB_COORD_t\n")
    @printf(io, "   spare:    %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_MOTION_SYSTEM_t) = 120
Base.sizeof(::Type{RDB_MOTION_SYSTEM_t}) = 120

function Base.read(io::IO, ::Type{RDB_END_OF_FRAME_t})
    RDB_END_OF_FRAME_t()
end
function Base.read!(io::IO, struct::RDB_END_OF_FRAME_t)
    struct
end
function Base.write(io::IO, struct::RDB_END_OF_FRAME_t)
end
function Base.show(io::IO, struct::RDB_END_OF_FRAME_t)
    println(io, "RDB_END_OF_FRAME_t:")
end

function Base.read(io::IO, ::Type{RDB_START_OF_FRAME_t})
    RDB_START_OF_FRAME_t()
end
function Base.read!(io::IO, struct::RDB_START_OF_FRAME_t)
    struct
end
function Base.write(io::IO, struct::RDB_START_OF_FRAME_t)
end
function Base.show(io::IO, struct::RDB_START_OF_FRAME_t)
    println(io, "RDB_START_OF_FRAME_t:")
end

function Base.read(io::IO, ::Type{RDB_STEER_2_DYN_t})
    playerId = read(io, UInt32)
    state = read(io, UInt32)
    angle = read(io, Cfloat)
    rev = read(io, Cfloat)
    torque = read(io, Cfloat)
    spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_STEER_2_DYN_t(playerId, state, angle, rev, torque, spare)
end
function Base.read!(io::IO, struct::RDB_STEER_2_DYN_t)
    struct.playerId = read(io, UInt32)
    struct.state = read(io, UInt32)
    struct.angle = read(io, Cfloat)
    struct.rev = read(io, Cfloat)
    struct.torque = read(io, Cfloat)
    struct.spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_STEER_2_DYN_t)
    write(io, struct.playerId)
    write(io, struct.state)
    write(io, struct.angle)
    write(io, struct.rev)
    write(io, struct.torque)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_STEER_2_DYN_t)
    println(io, "RDB_STEER_2_DYN_t:")
    @printf(io, "   playerId: %s\n", hex(struct.playerId))
    @printf(io, "   state:    %s\n", hex(struct.state))
    @printf(io, "   angle:    %+.16e\n",struct.angle)
    @printf(io, "   rev:      %+.16e\n",struct.rev)
    @printf(io, "   torque:   %+.16e\n",struct.torque)
    @printf(io, "   spare:    %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_STEER_2_DYN_t) = 52
Base.sizeof(::Type{RDB_STEER_2_DYN_t}) = 52

function Base.read(io::IO, ::Type{RDB_DYN_2_STEER_t})
    playerId = read(io, UInt32)
    state = read(io, UInt16)
    cmd = read(io, UInt16)
    effects = read(io, UInt32)
    torque = read(io, Cfloat)
    friction = read(io, Cfloat)
    damping = read(io, Cfloat)
    stiffness = read(io, Cfloat)
    velocity = read(io, Cfloat)
    angle = read(io, Cfloat)
    spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_DYN_2_STEER_t(playerId, state, cmd, effects, torque, friction, damping, stiffness, velocity, angle, spare)
end
function Base.read!(io::IO, struct::RDB_DYN_2_STEER_t)
    struct.playerId = read(io, UInt32)
    struct.state = read(io, UInt16)
    struct.cmd = read(io, UInt16)
    struct.effects = read(io, UInt32)
    struct.torque = read(io, Cfloat)
    struct.friction = read(io, Cfloat)
    struct.damping = read(io, Cfloat)
    struct.stiffness = read(io, Cfloat)
    struct.velocity = read(io, Cfloat)
    struct.angle = read(io, Cfloat)
    struct.spare = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_DYN_2_STEER_t)
    write(io, struct.playerId)
    write(io, struct.state)
    write(io, struct.cmd)
    write(io, struct.effects)
    write(io, struct.torque)
    write(io, struct.friction)
    write(io, struct.damping)
    write(io, struct.stiffness)
    write(io, struct.velocity)
    write(io, struct.angle)
    write(io, struct.spare)
end
function Base.show(io::IO, struct::RDB_DYN_2_STEER_t)
    println(io, "RDB_DYN_2_STEER_t:")
    @printf(io, "   playerId:  %s\n", hex(struct.playerId))
    @printf(io, "   state:     %s\n", hex(struct.state))
    @printf(io, "   cmd:       %s\n", hex(struct.cmd))
    @printf(io, "   effects:   %s\n", hex(struct.effects))
    @printf(io, "   torque:    %+.16e\n",struct.torque)
    @printf(io, "   friction:  %+.16e\n",struct.friction)
    @printf(io, "   damping:   %+.16e\n",struct.damping)
    @printf(io, "   stiffness: %+.16e\n",struct.stiffness)
    @printf(io, "   velocity:  %+.16e\n",struct.velocity)
    @printf(io, "   angle:     %+.16e\n",struct.angle)
    @printf(io, "   spare:     %s\n", hex(struct.spare))
end
Base.sizeof(::RDB_DYN_2_STEER_t) = 68
Base.sizeof(::Type{RDB_DYN_2_STEER_t}) = 68

# function Base.read(io::IO, ::Type{RDB_MSG_HDR_t})
#     magicNo = read(io, UInt16)
#     version = read(io, UInt16)
#     headerSize = read(io, UInt32)
#     dataSize = read(io, UInt32)
#     frameNo = read(io, UInt32)
#     simTime = read(io, Cdouble)
#     RDB_MSG_HDR_t(magicNo, version, headerSize, dataSize, frameNo, simTime)
# end
# function Base.read!(io::IO, struct::RDB_MSG_HDR_t)
#     struct.magicNo = read(io, UInt16)
#     struct.version = read(io, UInt16)
#     struct.headerSize = read(io, UInt32)
#     struct.dataSize = read(io, UInt32)
#     struct.frameNo = read(io, UInt32)
#     struct.simTime = read(io, Cdouble)
#     struct
# end
# function Base.write(io::IO, struct::RDB_MSG_HDR_t)
#     write(io, struct.magicNo)
#     write(io, struct.version)
#     write(io, struct.headerSize)
#     write(io, struct.dataSize)
#     write(io, struct.frameNo)
#     write(io, struct.simTime)
# end
# function Base.show(io::IO, struct::RDB_MSG_HDR_t)
#     println(io, "RDB_MSG_HDR_t:")
#     @printf(io, "   magicNo:    %s\n", hex(struct.magicNo))
#     @printf(io, "   version:    %s\n", hex(struct.version))
#     @printf(io, "   headerSize: %s\n", hex(struct.headerSize))
#     @printf(io, "   dataSize:   %s\n", hex(struct.dataSize))
#     @printf(io, "   frameNo:    %s\n", hex(struct.frameNo))
#     @printf(io, "   simTime:    %+.16e\n",struct.simTime)
# end

function Base.read(io::IO, ::Type{RDB_MSG_ENTRY_HDR_t})
    headerSize = read(io, UInt32)
    dataSize = read(io, UInt32)
    elementSize = read(io, UInt32)
    pkgId = read(io, UInt16)
    flags = read(io, UInt16)
    RDB_MSG_ENTRY_HDR_t(headerSize, dataSize, elementSize, pkgId, flags)
end
function Base.read!(io::IO, struct::RDB_MSG_ENTRY_HDR_t)
    struct.headerSize = read(io, UInt32)
    struct.dataSize = read(io, UInt32)
    struct.elementSize = read(io, UInt32)
    struct.pkgId = read(io, UInt16)
    struct.flags = read(io, UInt16)
    struct
end
function Base.write(io::IO, struct::RDB_MSG_ENTRY_HDR_t)
    write(io, struct.headerSize)
    write(io, struct.dataSize)
    write(io, struct.elementSize)
    write(io, struct.pkgId)
    write(io, struct.flags)
end
function Base.show(io::IO, struct::RDB_MSG_ENTRY_HDR_t)
    println(io, "RDB_MSG_ENTRY_HDR_t:")
    @printf(io, "   headerSize:  %s\n", hex(struct.headerSize))
    @printf(io, "   dataSize:    %s\n", hex(struct.dataSize))
    @printf(io, "   elementSize: %s\n", hex(struct.elementSize))
    @printf(io, "   pkgId:       %s\n", hex(struct.pkgId))
    @printf(io, "   flags:       %s\n", hex(struct.flags))
end

# function Base.read(io::IO, ::Type{RDB_MSG_t})
#     hdr = read(io, RDB_MSG_HDR_t)
#     entryHdr = read(io, RDB_MSG_ENTRY_HDR_t)
#     u = read(io, RDB_MSG_UNION_t)
#     RDB_MSG_t(hdr, entryHdr, u)
# end
# function Base.read!(io::IO, struct::RDB_MSG_t)
#     struct.hdr = read(io, RDB_MSG_HDR_t)
#     struct.entryHdr = read(io, RDB_MSG_ENTRY_HDR_t)
#     struct.u = read(io, RDB_MSG_UNION_t)
#     struct
# end
# function Base.write(io::IO, struct::RDB_MSG_t)
#     write(io, struct.hdr)
#     write(io, struct.entryHdr)
#     write(io, struct.u)
# end
# function Base.show(io::IO, struct::RDB_MSG_t)
#     println(io, "RDB_MSG_t:")
#     @printf(io, "   hdr:      RDB_MSG_HDR_t\n")
#     @printf(io, "   entryHdr: RDB_MSG_ENTRY_HDR_t\n")
#     @printf(io, "   u:        RDB_MSG_UNION_t\n")
# end

function Base.read(io::IO, ::Type{RDB_SHM_BUFFER_INFO_t})
    thisSize = read(io, UInt32)
    bufferSize = read(io, UInt32)
    id = read(io, UInt16)
    spare0 = read(io, UInt16)
    flags = read(io, UInt32)
    offset = read(io, UInt32)
    spare1 = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    RDB_SHM_BUFFER_INFO_t(thisSize, bufferSize, id, spare0, flags, offset, spare1)
end
function Base.read!(io::IO, struct::RDB_SHM_BUFFER_INFO_t)
    struct.thisSize = read(io, UInt32)
    struct.bufferSize = read(io, UInt32)
    struct.id = read(io, UInt16)
    struct.spare0 = read(io, UInt16)
    struct.flags = read(io, UInt32)
    struct.offset = read(io, UInt32)
    struct.spare1 = (read(io, UInt32), read(io, UInt32), read(io, UInt32), read(io, UInt32))
    struct
end
function Base.write(io::IO, struct::RDB_SHM_BUFFER_INFO_t)
    write(io, struct.thisSize)
    write(io, struct.bufferSize)
    write(io, struct.id)
    write(io, struct.spare0)
    write(io, struct.flags)
    write(io, struct.offset)
    write(io, struct.spare1)
end
function Base.show(io::IO, struct::RDB_SHM_BUFFER_INFO_t)
    println(io, "RDB_SHM_BUFFER_INFO_t:")
    @printf(io, "   thisSize:   %s\n", hex(struct.thisSize))
    @printf(io, "   bufferSize: %s\n", hex(struct.bufferSize))
    @printf(io, "   id:         %s\n", hex(struct.id))
    @printf(io, "   spare0:     %s\n", hex(struct.spare0))
    @printf(io, "   flags:      %s\n", hex(struct.flags))
    @printf(io, "   offset:     %s\n", hex(struct.offset))
    @printf(io, "   spare1:     %s\n", hex(struct.spare1))
end
Base.sizeof(::RDB_SHM_BUFFER_INFO_t) = 36
Base.sizeof(::Type{RDB_SHM_BUFFER_INFO_t}) = 36

function Base.read(io::IO, ::Type{RDB_SHM_HDR_t})
    headerSize = read(io, UInt32)
    dataSize = read(io, UInt32)
    noBuffers = read(io, UInt8)
    RDB_SHM_HDR_t(headerSize, dataSize, noBuffers)
end
function Base.read!(io::IO, struct::RDB_SHM_HDR_t)
    struct.headerSize = read(io, UInt32)
    struct.dataSize = read(io, UInt32)
    struct.noBuffers = read(io, UInt8)
    struct
end
function Base.write(io::IO, struct::RDB_SHM_HDR_t)
    write(io, struct.headerSize)
    write(io, struct.dataSize)
    write(io, struct.noBuffers)
end
function Base.show(io::IO, struct::RDB_SHM_HDR_t)
    println(io, "RDB_SHM_HDR_t:")
    @printf(io, "   headerSize: %s\n", hex(struct.headerSize))
    @printf(io, "   dataSize:   %s\n", hex(struct.dataSize))
    @printf(io, "   noBuffers:  %s\n", hex(struct.noBuffers))
end

############

function Base.hex(tup::Tuple)
    str = "("
    for (i,x) in enumerate(tup)
        if i != 1
            str = str * ", "
        end
        str = str * hex(x)
    end
    str * ")"
end
function Base.write(io::IO, tup::Tuple)
    for x in tup
        write(io, x)
    end
end

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
function rdb_type_to_pkg_id(rdbtype::Any)
    if isa(rdbtype, RDB_START_OF_FRAME_t)
        RDB_PKG_ID_START_OF_FRAME
    elseif isa(rdbtype, RDB_END_OF_FRAME_t)
        RDB_PKG_ID_END_OF_FRAME
    elseif isa(rdbtype, RDB_COORD_SYSTEM_t)
        RDB_PKG_ID_COORD_SYSTEM
    elseif isa(rdbtype, RDB_COORD_t    )
        RDB_PKG_ID_COORD
    elseif isa(rdbtype, RDB_ROAD_POS_t)
        RDB_PKG_ID_ROAD_POS
    elseif isa(rdbtype, RDB_LANE_INFO_t)
        RDB_PKG_ID_LANE_INFO
    elseif isa(rdbtype, RDB_ROADMARK_t)
        RDB_PKG_ID_ROADMARK
    elseif isa(rdbtype, RDB_OBJECT_CFG_t)
        RDB_PKG_ID_OBJECT_CFG
    elseif isa(rdbtype, RDB_OBJECT_STATE_t)
        RDB_PKG_ID_OBJECT_STATE
    elseif isa(rdbtype, RDB_VEHICLE_SYSTEMS_t)
        RDB_PKG_ID_VEHICLE_SYSTEMS
    elseif isa(rdbtype, RDB_VEHICLE_SETUP_t)
        RDB_PKG_ID_VEHICLE_SETUP
    elseif isa(rdbtype, RDB_ENGINE_t)
        RDB_PKG_ID_ENGINE
    elseif isa(rdbtype, RDB_DRIVETRAIN_t)
        RDB_PKG_ID_DRIVETRAIN
    elseif isa(rdbtype, RDB_WHEEL_t)
        RDB_PKG_ID_WHEEL
    elseif isa(rdbtype, RDB_PED_ANIMATION_t)
        RDB_PKG_ID_PED_ANIMATION
    elseif isa(rdbtype, RDB_SENSOR_STATE_t)
        RDB_PKG_ID_SENSOR_STATE
    elseif isa(rdbtype, RDB_SENSOR_OBJECT_t)
        RDB_PKG_ID_SENSOR_OBJECT
    elseif isa(rdbtype, RDB_CAMERA_t)
        RDB_PKG_ID_CAMERA
    elseif isa(rdbtype, RDB_CONTACT_POINT_t)
        RDB_PKG_ID_CONTACT_POINT
    elseif isa(rdbtype, RDB_TRAFFIC_SIGN_t)
        RDB_PKG_ID_TRAFFIC_SIGN
    elseif isa(rdbtype, RDB_ROAD_STATE_t)
        RDB_PKG_ID_ROAD_STATE
    elseif isa(rdbtype, RDB_IMAGE_t)
        RDB_PKG_ID_IMAGE
    elseif isa(rdbtype, RDB_LIGHT_SOURCE_t)
        RDB_PKG_ID_LIGHT_SOURCE
    elseif isa(rdbtype, RDB_ENVIRONMENT_t)
        RDB_PKG_ID_ENVIRONMENT
    elseif isa(rdbtype, RDB_TRIGGER_t)
        RDB_PKG_ID_TRIGGER
    elseif isa(rdbtype, RDB_DRIVER_CTRL_t)
        RDB_PKG_ID_DRIVER_CTRL
    elseif isa(rdbtype, RDB_TRAFFIC_LIGHT_t)
        RDB_PKG_ID_TRAFFIC_LIGHT
    elseif isa(rdbtype, RDB_SYNC_t)
        RDB_PKG_ID_SYNC
    elseif isa(rdbtype, RDB_DRIVER_PERCEPTION_t)
        RDB_PKG_ID_DRIVER_PERCEPTION
    # elseif isa(rdbtype, RDB_LIGHT_MAP_t
    #     RDB_PKG_ID_LIGHT_MAP
    # elseif isa(rdbtype, RDB_TONE_MAPPING_t
    #     RDB_PKG_ID_TONE_MAPPING
    elseif isa(rdbtype, RDB_ROAD_QUERY_t)
        RDB_PKG_ID_ROAD_QUERY
    elseif isa(rdbtype, RDB_SCP_t)
        RDB_PKG_ID_SCP
    elseif isa(rdbtype, RDB_TRAJECTORY_t)
        RDB_PKG_ID_TRAJECTORY
    elseif isa(rdbtype, RDB_DYN_2_STEER_t)
        RDB_PKG_ID_DYN_2_STEER
    elseif isa(rdbtype, RDB_STEER_2_DYN_t)
        RDB_PKG_ID_STEER_2_DYN
    elseif isa(rdbtype, RDB_PROXY_t)
        RDB_PKG_ID_PROXY
    elseif isa(rdbtype, RDB_MOTION_SYSTEM_t)
        RDB_PKG_ID_MOTION_SYSTEM
    # elseif isa(rdbtype, RDB_OCCLUSION_MATRIX_t
    #     RDB_PKG_ID_OCCLUSION_MATRIX
    # elseif isa(rdbtype, RDB_CUSTOM_SCORING_t
    #     RDB_PKG_ID_RDB_PKG_ID_CUSTOM_SCORING     
    # elseif isa(rdbtype, RDB_CUSTOM_AUDI_FORUM_t
    #     RDB_PKG_ID_RDB_PKG_ID_CUSTOM_AUDI_FORUM  
    # elseif isa(rdbtype, RDB_CUSTOM_OPTIX_START_t
    #     RDB_PKG_ID_RDB_PKG_ID_CUSTOM_OPTIX_START 
    # elseif isa(rdbtype, RDB_OPTIX_BUFFER_t
    #     RDB_PKG_ID_RDB_PKG_ID_OPTIX_BUFFER       
    # elseif isa(rdbtype, RDB_CUSTOM_OPTIX_END_t
    #     RDB_PKG_ID_RDB_PKG_ID_CUSTOM_OPTIX_END   
    # elseif isa(rdbtype, RDB_CUSTOM_USER_A_START_t
    #     RDB_PKG_ID_RDB_PKG_ID_CUSTOM_USER_A_START
    # elseif isa(rdbtype, RDB_CUSTOM_USER_A_END_t
    #     RDB_PKG_ID_RDB_PKG_ID_CUSTOM_USER_A_END  
    else
        error("unknown RDB package rdbtype $rdbtype")
        convert(Cint, 999)
    end
end
function rdb_pkg_id_to_type(id::Integer)
    # NOTE(tim): returns a UInt16

    if id == RDB_PKG_ID_START_OF_FRAME    
        RDB_START_OF_FRAME_t
    elseif id == RDB_PKG_ID_END_OF_FRAME      
        RDB_END_OF_FRAME_t
    elseif id == RDB_PKG_ID_COORD_SYSTEM      
        RDB_COORD_SYSTEM_t
    elseif id == RDB_PKG_ID_COORD             
        RDB_COORD_t
    elseif id == RDB_PKG_ID_ROAD_POS          
        RDB_ROAD_POS_t
    elseif id == RDB_PKG_ID_LANE_INFO         
        RDB_LANE_INFO_t
    elseif id == RDB_PKG_ID_ROADMARK          
        RDB_ROADMARK_t
    elseif id == RDB_PKG_ID_OBJECT_CFG        
        RDB_OBJECT_CFG_t
    elseif id == RDB_PKG_ID_OBJECT_STATE      
        RDB_OBJECT_STATE_t
    elseif id == RDB_PKG_ID_VEHICLE_SYSTEMS   
        RDB_VEHICLE_SYSTEMS_t
    elseif id == RDB_PKG_ID_VEHICLE_SETUP     
        RDB_VEHICLE_SETUP_t
    elseif id == RDB_PKG_ID_ENGINE            
        RDB_ENGINE_t
    elseif id == RDB_PKG_ID_DRIVETRAIN        
        RDB_DRIVETRAIN_t
    elseif id == RDB_PKG_ID_WHEEL             
        RDB_WHEEL_t
    elseif id == RDB_PKG_ID_PED_ANIMATION     
        RDB_PED_ANIMATION_t
    elseif id == RDB_PKG_ID_SENSOR_STATE      
        RDB_SENSOR_STATE_t
    elseif id == RDB_PKG_ID_SENSOR_OBJECT     
        RDB_SENSOR_OBJECT_t
    elseif id == RDB_PKG_ID_CAMERA            
        RDB_CAMERA_t
    elseif id == RDB_PKG_ID_CONTACT_POINT     
        RDB_CONTACT_POINT_t
    elseif id == RDB_PKG_ID_TRAFFIC_SIGN      
        RDB_TRAFFIC_SIGN_t
    elseif id == RDB_PKG_ID_ROAD_STATE        
        RDB_ROAD_STATE_t
    elseif id == RDB_PKG_ID_IMAGE             
        RDB_IMAGE_t
    elseif id == RDB_PKG_ID_LIGHT_SOURCE      
        RDB_LIGHT_SOURCE_t
    elseif id == RDB_PKG_ID_ENVIRONMENT       
        RDB_ENVIRONMENT_t
    elseif id == RDB_PKG_ID_TRIGGER           
        RDB_TRIGGER_t
    elseif id == RDB_PKG_ID_DRIVER_CTRL       
        RDB_DRIVER_CTRL_t
    elseif id == RDB_PKG_ID_TRAFFIC_LIGHT     
        RDB_TRAFFIC_LIGHT_t
    elseif id == RDB_PKG_ID_SYNC              
        RDB_SYNC_t
    elseif id == RDB_PKG_ID_DRIVER_PERCEPTION 
        RDB_DRIVER_PERCEPTION_t
    # elseif id == RDB_PKG_ID_LIGHT_MAP         
    #     RDB_LIGHT_MAP_t
    # elseif id == RDB_PKG_ID_TONE_MAPPING      
    #     RDB_TONE_MAPPING_t
    elseif id == RDB_PKG_ID_ROAD_QUERY        
        RDB_ROAD_QUERY_t
    elseif id == RDB_PKG_ID_SCP               
        RDB_SCP_t
    elseif id == RDB_PKG_ID_TRAJECTORY        
        RDB_TRAJECTORY_t
    elseif id == RDB_PKG_ID_DYN_2_STEER       
        RDB_DYN_2_STEER_t
    elseif id == RDB_PKG_ID_STEER_2_DYN       
        RDB_STEER_2_DYN_t
    elseif id == RDB_PKG_ID_PROXY             
        RDB_PROXY_t
    elseif id == RDB_PKG_ID_MOTION_SYSTEM     
        RDB_MOTION_SYSTEM_t
    # elseif id == RDB_PKG_ID_OCCLUSION_MATRIX  
    #     RDB_OCCLUSION_MATRIX_t
    # elseif id == RDB_PKG_ID_CUSTOM_SCORING
    #     RDB_RDB_PKG_ID_CUSTOM_SCORING_t     
    # elseif id == RDB_PKG_ID_CUSTOM_AUDI_FORUM
    #     RDB_RDB_PKG_ID_CUSTOM_AUDI_FORUM_t  
    # elseif id == RDB_PKG_ID_CUSTOM_OPTIX_START
    #     RDB_RDB_PKG_ID_CUSTOM_OPTIX_START_t 
    # elseif id == RDB_PKG_ID_OPTIX_BUFFER
    #     RDB_RDB_PKG_ID_OPTIX_BUFFER_t       
    # elseif id == RDB_PKG_ID_CUSTOM_OPTIX_END
    #     RDB_RDB_PKG_ID_CUSTOM_OPTIX_END_t   
    # elseif id == RDB_PKG_ID_CUSTOM_USER_A_START
    #     RDB_RDB_PKG_ID_CUSTOM_USER_A_START_t
    # elseif id == RDB_PKG_ID_CUSTOM_USER_A_END
    #     RDB_RDB_PKG_ID_CUSTOM_USER_A_END_t  
    else
        warn("unknown RDB package id $id")
        "UNKNOWN"
    end
end



