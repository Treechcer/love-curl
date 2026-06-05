--body = os.execute('curl https://jsonplaceholder.typicode.com/todos/1 -H "Accept: application/json"')
http = {}

---@param URL string
---@param curlVars string?
---@return string
function http.reqest(URL, curlVars)
    handler = io.popen('curl ' .. URL .. " " .. curlVars .. ' 2>/dev/null')
    body = handler:read("a")
    handler:close()

    return body
end

---@param URL string
---@param curlVars string?
---@return table
function http.JSONRequest(URL, curlVars) --auomatically add '-H "Accept: application/json!"' to your request for JSON and returns in as a lua table
    handler = io.popen('curl ' .. URL .. " " .. curlVars .. ' -H "Accept: application/json!"' .. ' 2>/dev/null')
    body = handler:read("a")
    handler:close()

    body = body:gsub('"([^"]+)"%s*:%s*', '["%1"] = ')

    a = loadstring("return " .. body)()

    return a
end

return http