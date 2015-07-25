function find_vtd_directory()
    @linux ? (
            begin
                hd = homedir()
                for content in readdir(hd)
                    path = joinpath(hd, content)
                    if ismatch(r"VTD\.\d+\.\d+", content) && isdir(path)
                        return path
                    end
                end
                error("VTD directory not found")  
            end
            : error("non-linux os's not supported!")
            )
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