function foo(a)
    print("foo", a)
    return coroutine.yield(2 * a)
end

co = coroutine.create(function(a, b)
    print("co-body", a, b)
    local r = foo(a + 1)
    print("co-body", r)
    local r, s = coroutine.yield(a + b, a - b)
    print("co-body", r, s)
    return b, "end"
end)

print("1 main", coroutine.resume(co, 1, 10))
print("2 main", coroutine.resume(co, "r"))
print("3 main", coroutine.resume(co, "x", "y"))
print("4 main", coroutine.resume(co, "x", "y"))
