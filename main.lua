love = require("love")

function love.load()
    http = require("lib-main")
    --req = http.reqest('https://jsonplaceholder.typicode.com/todos/1', '-H "Accept: application/json!"')
    req = http.StringParser(http.JSONRequest('https://jsonplaceholder.typicode.com/todos/1'))

    print(req)
end

function love.update(dt)

end