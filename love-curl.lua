--body = os.execute('curl https://jsonplaceholder.typicode.com/todos/1 -H "Accept: application/json"')
http = {}

---@param str string
---@return string
function http.JSONparser(str) --parses string JSON into Lua table
    --I want to retorn only str, so I hate to save it as variable yk
    local ret = str:gsub("[", "{"):gsub("]", "}"):gsub('"([^"]+)"%s*:%s*', '["%1"] = ')
    return ret
end

---@param jsonTable table
---@return string
function http.StringParser(jsonTable) --parses motmal table into JSON
    str = "{"
    
    for key, value in pairs(jsonTable) do
        quotes = (type(value) == "string") and '"' or ""
        str = str .. '"' .. key .. '" : ' .. quotes .. tostring(value) .. quotes .. ","
    end

    return str:sub(1, str:len() - 1) .. "}"
end

---@param URL string
---@param curlVars string?
---@return string
function http.reqest(URL, curlVars)
    curlVars = curlVars or ""
    handler = io.popen('curl ' .. URL .. " " .. curlVars .. ' 2>/dev/null')
    body = handler:read("a")
    handler:close()

    return body
end

---@param URL string
---@param curlVars string?
---@return table
function http.JSONRequest(URL, curlVars) --auomatically add '-H "Accept: application/json!"' to your request for JSON and returns in as a lua table
    curlVars = curlVars or ""
    ---@diagnostic disable-next-line
    body = loadstring("return " .. http.JSONparser(http.reqest(URL, curlVars .. ' -H "Accept: application/json!"')))()

    return body
end

return http
