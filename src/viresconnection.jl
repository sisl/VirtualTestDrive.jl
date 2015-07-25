type ViresConnection
    socket::TcpSocket
    ViresConnection() = ViresConnection(TCP_PORT)
    ViresConnection(socket::TcpSocket) = new(socket)
    function ViresConnection(port::Integer;
        sleeptime::Float64=0.1, # [sec]
        timeout::Float64=TIMEOUT_LONG_DEFAULT # [sec]
        )

        start_vires_vtd_tasks()
        socket = connect(port)

        # idle until connection is available
        start_time = time()
        while !isopen(socket) && time() - start_time < timeout
            sleep(sleeptime)
        end
        
        @assert(isopen(socket))
        retval = new(socket)
        finalizer(retval, obj->begin
            close(obj.socket)
            stop_vires_components()
        end)
        retval
    end
end