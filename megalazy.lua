#!/usr/bin/env luajit
--[[
-- Powered by pro.lua Telegram conference team, 2021.
--]]

local add = function(...)
    local acc = 0
    local arg = {...}
    for i = 1, #arg, 1 do
        acc = acc + arg[1]
    end
    return acc
end

--[[
Действия описывают среду или среда описывает действия?
--]]

function mega_lazy(func)
    return function(...)
        local args = {...}
        return function()
            return func(unpack(args))
        end
    end
end

function mul(a, b) return a * b end

local add = mega_lazy(add)
local mul = mega_lazy(mul)
local sequence = {
    add(1, 2, 3, 4, 5), 
    add(6, 7, 8, 9, -1), 
    mul(2, 3, 4), 
    --mul(mul(1, 2, 3), mul(0, 0, 1))
}

for _, func in pairs(sequence) do
    print(func())
end
