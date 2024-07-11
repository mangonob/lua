function createObserver()
    local subscribers = {}

    return {
        subscribe = function(listener)
            subscribers[#subscribers + 1] = listener
        end,
        dispatch = function(e)
            for _, sub in ipairs(subscribers) do
                sub(e)
            end
        end
    }
end

local observer = createObserver()
observer.subscribe(function(e)
    print("Subscriber 1 receive event " .. e)
end)

observer.subscribe(function(e)
    print("Subscriber 2 receive event " .. e)
end)

observer.dispatch(1)
observer.dispatch(2)
observer.dispatch(3)
