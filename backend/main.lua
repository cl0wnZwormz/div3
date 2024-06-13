local button_create = get("mode_create")
local button_update = get("mode_update")
local button_delete = get("mode_delete")

local button_execute = get("execute")

local input_id = get("input_id")
local input_title = get("input_title")
local input_image = get("input_image")
local input_description = get("input_description")

local div_id = get("div_id")
local div_title = get("div_title")
local div_image = get("div_image")
local div_preview = get("div_preview")
local div_description = get("div_description")

local view_all = {div_id, div_title, div_image, div_preview, div_description}
local view_create = {div_title, div_image, div_preview, div_description}
local view_update = {div_id, div_title, div_image, div_preview, div_description}
local view_delete = {div_id}

-- local execute_strings = {view_all = "Execute action!", view_create = "Create post!", view_update = "Update post!", view_delete = "Delete post!"}

local current_view = view_all

function setView(view: {})
    current_view = view
    for _,v in pairs(view_all) do
        v.set_visible(false)
    end
    for _,v in pairs(view) do
        v.set_visible(true)
    end
    -- setExectuteButton(view)
end

function setExectuteButton(mode: string)
    print("New button content: "..mode)
    button_execute.set_content(mode)
end

button_create.on_click(function() 
    setView(view_create) 
    setExectuteButton("Create post!")
end)
button_update.on_click(function() 
    setView(view_update) 
    setExectuteButton("Update post!")
end)
button_delete.on_click(function() 
    setView(view_delete) 
    setExectuteButton("Delete post!")
end)

setView(view_create)
setExectuteButton("Create post!")