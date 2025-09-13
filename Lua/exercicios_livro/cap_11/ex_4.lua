--[[
Assuma	 a	 representação	 de	 grafo	 do	 exercício	 anterior,	 com	 o	 rótulo	 de	 cada	 arco representando	 a	 distância	 entre	 as	 suas	 pontas.	 Escreva	 uma	 função	 para	 encontrar	 o	 menor caminho	entre	dois	nós	dados	(dica:	use	o	algoritmo	de	Dijkstra).

--]]


local filleName = "grafo.txt"

local calculaMenorDistancia (grafo, no1, no2)
    local caminho = ''
    local distancia = 0
    if then
    end
end

local function name2node (graph, name)
        local node = graph[name]
        if not node then
                -- nó não existe; cria um novo nó
                node = {name = name, inc = {}}
                graph[name] = node
        end

        return node
end

function readgraph ()
        local graph = {}
        for line in io.lines(filleName) do
                -- quebra a linha em dois nomes
                local padrao = "(%S+)%s+(%S+)%s(%d+)"
                local namefrom, nameto, rotulo = string.match(>
                -- encontra os nós correspondentes
                local from = name2node(graph, namefrom)
                local to = name2node(graph, nameto)
                -- adiciona o arco no grafo e incidencias
                local arc = {rot = tostring(rotulo), alv = to}
                --graph.arc[rotulo] = arc
                from.inc[arc.rot] = arc

        end

        return graph
end

local graph = readgraph()
for _, v in pairs(graph) do
        io.write(string.format(
                "   %s%s" .. " ---> ", v.name, string.rep(" ",>
                ))
        for k, v2 in pairs(v.inc) do
                if v2 then
                        io.write(string.format(
                        " %s (%d)", v2.alv.name, k
                        ))
                end
        end
        io.write("\n")
end

