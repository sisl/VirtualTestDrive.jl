function find_vtd_directory()
    @linux ? (
            begin
                hd = homedir()
                for content in readdir(hd)
                    path = joinpath(hd, content)
                    if ismatch(r"VTD\.\d+\.\d+", content) && isdir(path)
                        dir = joinpath(path, "Data", "Setups", "Current", "Bin")
                        return dir
                    end
                end
                error("VTD directory not found")  
            end
            : error("non-linux os's not supported!")
            )
end
function start_vires_vtd_tasks()
    dir = find_vtd_directory()
    cd(dir) do
        run(`./startTasks`)
    end
end
function stop_vires_components()
    dir = find_vtd_directory()
    cd(dir) do
        run(`./stopTasks`)
    end
end