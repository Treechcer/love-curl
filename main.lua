love = require("love")

function love.load()
    http = require("lib-main")
    req = http.reqest('https://jsonplaceholder.typicode.com/todos/1', '-H "Accept: application/json!"')

    print(req)
end

function love.update(dt)

end