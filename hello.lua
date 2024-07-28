require("./utils")

function foo(...)
    for i = 1, 10 do
        coroutine.yield(i * i)
    end
end

co = coroutine.create(foo)

while true do
    local success, v = coroutine.resume(co)
    if coroutine.status(co) ~= "dead" then
        print(v)
    else
        break
    end
end

print("Iterator finish")
