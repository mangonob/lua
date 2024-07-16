function merge(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end
end

function merged(t1, t2)
    local t = {}
end

function __value2str(v, trace)
    trace = trace or {}

    if type(v) == "table" then
        local s = "{"
        local first = true

        for _, t in pairs(trace) do
            if v == t then
                return "<... circular>"
            end
        end

        _trace = {v, table.unpack(trace)}
        for k, v in pairs(v) do
            if first then
                s = s .. string.format(" %s = %s", __value2str(k, _trace), __value2str(v, _trace))
                first = false
            else
                s = s .. string.format(", %s = %s", __value2str(k, _trace), __value2str(v, _trace))
            end
        end

        if not first then
            s = s .. " }"
        else
            s = s .. "}"
        end

        return s
    else
        return tostring(v)
    end
end

function table2string(t)
    if type(t) == "table" then
        return __value2str(t)
    else
        error("Not a table")
    end
end

function ptable(t)
    print(table2string(t))
end

function create(a, meta)
    local m = getmetatable(a)
    if m ~= nil then
        merge(m, meta)
    else
        setmetatable(a, meta)
    end
    return a
end
