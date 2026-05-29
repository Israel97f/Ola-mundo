local conjunto = {}

local mt = {
	__tostring = function (t)
		local str = ""
		for k, v in pairs(t) do
			str = str .. " " .. k .. ","
		end
		str = string.sub(str, 1, -2)
		return  "{" .. str .. " }"
	end,

	__sub = function (a, b)
		local conj = conjunto.new()
		for k, _ in pairs(a) do conj[k] = true end
		for k in pairs(a) do
			if b[k] then conj[k] = nil end
		end
		return conj
	end,

	__add = function (a, b)
		local conj = conjunto.new()
		for k, _ in pairs(a) do conj[k] = true end
		for k, _ in pairs(b) do conj[k] = true end
		return conj
	end
}

function conjunto.new(...)
	local coj = {}
	for _, v in pairs({...}) do
		coj[v] = true
	end
	setmetatable(coj, mt)
	return coj
end

local a = conjunto.new(4, 5, 6, 1 , 7, 3)
local b = conjunto.new(4, 9, 11, 15)
local c = conjunto.new(4, 9, 11, 15, 7, 6, 19)

print(a)
print(b)
print(a - b)
print(b - a)
print(c - b)