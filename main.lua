love = require("love")

function love.load()

    --This is supposed to be test of http library, ou have to delete this in your projet!

    http = require("http-wrapper")
    --req = http.reqest('https://jsonplaceholder.typicode.com/todos/1')
    req = http.StringParser(http.JSONRequest('https://jsonplaceholder.typicode.com/todos/1'))

    print(req)
end

function love.update(dt)

end