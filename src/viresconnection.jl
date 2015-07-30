const SCP_PORT = 48179
const UDP_PORT = 48190

type ViresConnection
    SCP::TcpSocket
    UDP::TcpSocket

    ViresConnection() = ViresConnection(SCP_PORT, UDP_PORT)
    ViresConnection(SCP::TcpSocket, UDP::TcpSocket) = new(SCP, UDP)
    function ViresConnection(scp_port::Integer, udp_port::Integer;
        sleeptime::Float64=0.05, # [sec]
        timeout::Float64=TIMEOUT_LONG_DEFAULT # [sec]
        )

        start_vires_vtd_tasks()
        
        # connect and idle until connection is available
        SCP = connect(scp_port)
        start_time = time()
        while !isopen(SCP) && time() - start_time < timeout
            sleep(sleeptime)
        end

        # connect and idle until connection is available
        UDP = connect(udp_port)
        start_time = time()
        while !isopen(UDP) && time() - start_time < timeout
            sleep(sleeptime)
        end

        @assert(isopen(SCP))
        @assert(isopen(UDP))

        retval = new(SCP, UDP)
        
        # fout = open("/tmp/textudp.dat", "w")
        # @async while isopen(UDP)
        #     # print(STDOUT, hex(read(UDP, Uint8)))
        #     # header = read(UDP, RDB_MSG_HDR_t)
        #     # println(STDOUT, header)
        #     # write(fout, read(UDP, Uint8))
        #     println(fout, read(UDP, RDB_Package))
        # end

        @lintpragma( "Ignore unused obj" )
        finalizer(retval, obj->stop_vires_components())
        retval
    end
end