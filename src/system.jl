function find_vtd_directory(error_on_fail::Bool=true)
    @linux ? (
            begin
                hd = homedir()
                for content in readdir(hd)
                    path = joinpath(hd, content)
                    if ismatch(r"VTD\.\d+\.\d+", content) && isdir(path)
                        return path
                    end
                end
                error_on_fail && error("VTD directory not found")
            end
            : begin
                error_on_fail && error("non-linux os's not supported!")
            end
            )
    "" # return empty string if no error was thrown and path was not found
end
function start_vires_vtd_tasks()
    dir = joinpath(find_vtd_directory(), "Data", "Setups", "Current", "Bin")
    cd(dir) do
        run(`./startTasks`)
    end
end
function stop_vires_components()
    dir = joinpath(find_vtd_directory(), "Data", "Setups", "Current", "Bin")
    cd(dir) do
        run(`./stopTasks`)
    end
end