local config = {
    state_file = "vlc_playlist_state.txt",
    auto_save_interval = 30 -- seconds
}

function load_state()
    local file = io.open(config.state_file, "r")
    local state = nil
    if file then
        state = file:read("*a")
        file:close()
    end
    return state
end

function save_state(state)
    local file = io.open(config.state_file, "w+")
    if file then
        file:write(state)
        file:close()
    end
end

function descriptor()
    return {
        title = "Playlist Tracker",
        version = "1.0",
        author = "Basten",
        description = "Tracks playlist position across VLC sessions",
        capabilities = { "input-listener" }
    }
end

function input_changed()
    update_state()
end

function update_state()
    if vlc.input.is_playing() and vlc.playlist.status() == "playing" then
        local currentItem = vlc.playlist.current()
        save_state(currentItem)
    end
end

function activate()
    local state = load_state()
    if state then
        vlc.playlist.goto(state)
    end
end

function deactivate()
    update_state()
end
