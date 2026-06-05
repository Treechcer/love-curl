--body = os.execute('curl https://jsonplaceholder.typicode.com/todos/1 -H "Accept: application/json"')
http = {}

function http.reqest(URL, curlVars)
    handler = io.popen('curl ' .. URL .. " " .. curlVars .. ' 2>/dev/null')
    body = handler:read("a")
    handler:close()

    body = body:gsub('"([^"]+)"%s*:%s*', '["%1"] = ')

    a = loadstring("return " .. body)()

    return a
end

return http