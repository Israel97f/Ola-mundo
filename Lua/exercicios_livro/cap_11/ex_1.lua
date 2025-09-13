-- Modifique a implementação de fila de forma que os dois índices voltem a zero quando ela ficar
-- vazia.

List = {}
function List.new ()
	return {first = 0, last = -1}
end


function List.pushfirst (list, value)
	local first = list.first - 1
	list.first = first
	list[first] = value
end


function List.pushlast (list, value)
	local last = list.last + 1
	list.last = last
	list[last] = value
end


function List.popfirst (list)
	local first = list.first
	if first > list.last then error("list is empty") end
	local value = list[first]
	list[first] = nil	-- para permitir coleta de lixo
	list.first = not (first == list.last) and first + 1 or 0
	return value
end


function List.poplast (list)
	local last = list.last
	if list.first > last then error("list is empty") end
	local value = list[last]
	list[last] = nil	-- para permitir coleta de lixo
	list.last = not (list.first == last) and last - 1 or -1
	return value
end
