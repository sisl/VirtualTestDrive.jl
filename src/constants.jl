const TCP_PORT = 48179
const CLIENT_NAME = "SCP"

const VIRES_MAGIC_NUMBER = @compat UInt16(40108)
const VIRES_VERSION_HEADER = @compat UInt16(1)
const VIRES_HEADER_STRING_LEN = 64
const VIRES_HEADER_LEN = 2*2 + 2*VIRES_HEADER_STRING_LEN + 4

const RDB_MAGIC_NUMBER = @compat UInt16(35712)
const RDB_VERSION = @compat UInt16(0x0118)
const RDB_PKG_ID_START_OF_FRAME = @compat UInt16(1)
const RDB_PKG_ID_END_OF_FRAME = @compat UInt16(2)

const NULL = zero(Uint8)

const TIMEOUT_DEFAULT = 2.0 # [s]
const TIMEOUT_LONG_DEFAULT = 20.0 # [s]