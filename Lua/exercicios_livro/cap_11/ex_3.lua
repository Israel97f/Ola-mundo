--[[

	Modifique a estrutura de um grafo para que ele possa guardar um rótulo
para cada arco. A estrutura deverá representar cada arco também por um ob-
jeto, com dois campos: o seu rótulo e o nó para o qual ele aponta.
	Em vez de um conjunto de adjacências, cada nó deverá manter um conjun-
to de incidências, contendo os arcos que se originam naquele nó. Adaptea
função readgraph para que ela leia, de cada linha do arquivo de entrada, 
doisnomes de nós mais um rótulo (assuma que o rótulo seja um número).

--]]
local filleName = "grafo.txt"

local function name2node (graph, name)
	local node = graph[name]
	if not node then
		-- nó não existe; cria um novo nó
		node = {name = name, adj = {}}
		graph[name] = node
	end

	return node
end

function readgraph ()
	local graph = {}
	for line in io.lines(filleName) do
		-- quebra a linha em dois nomes
		local namefrom, nameto = string.match(line, "(%S+)%s+(%S+)")
		-- encontra os nós correspondentes
		local from = name2node(graph, namefrom)
		local to = name2node(graph, nameto)
		-- adiciona 'to' ao conjunto adjacente de 'from'
		from.adj[to.name] = true
	end

	return graph
end

local graph = readgraph()
for _, v in pairs(graph) do
	io.write(v.name .. " ")
	for k, _ in pairs(v.adj) do
		io.write(k)
	end
	io.write("\n")
end