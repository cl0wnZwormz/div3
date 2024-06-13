local post_title = get("post_title")
local post_image = get("post_image")
local post_description = get("post_description")

local button_previous = get("up")
local button_next = get("down")

local BASE_API_URL = "https://cors.themackabu.dev/?https://6491-213-157-191-120.ngrok-free.app/"
local current_id = -1
local max_id = -1

function getPost(postId: string): ( number, string, string, string )
    local response = fetch({
        url = BASE_API_URL .. postId,
        method = "GET",
        headers = { ["Content-Type"] = "application/json" },
    })

    print("Fetched post "..response["id"])

    return response["id"], response["title"], response["imageUrl"], response["description"]
end

function urlExists(testUrl: string): boolean
    local response = fetch({
        url = testUrl,
        method = "GET",
        headers = { ["Content-Type"] = "image" },
    })
    -- print(response)
    if (response == nil or response["status"] == 404) then return false end
    return true
end

function setPost(urlEndpoint: string): number
    local title: string
    local image_url: string
    local description: string
    current_id, title, image_url, description = getPost(urlEndpoint)

    post_title.set_content(title)
    if (image_url~=nil and #image_url > 0 and urlExists(image_url)) then
        post_image.set_source(image_url)
        post_image.set_visible(true)
    else
        post_image.set_visible(false)
    end
    post_description.set_content(description)
    return current_id
end

function setLatestPost()
    setPost("posts/latest")
    max_id = current_id
end

function scrollPost(offset: number): boolean
    if (current_id + offset > max_id or current_id + offset <= 0) then
        return false
    else
        setPost("postsid/"..current_id+offset)
        return true
    end
end

-- print(urlExists("https://example.com/image.jpg"))


button_next.on_click(function()
    scrollPost(-1)
end)
    
button_previous.on_click(function()
    scrollPost(1)
end)

setLatestPost()