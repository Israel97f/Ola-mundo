--[[
Assuma a representação de grafo do exercício anterior, com o rótulo de cada 
arco representando a distância entre as suas pontas. Escreva uma função para
encontrar o menor caminho entre dois nós dados (dica: use o algoritmo de Di-
jkstra).

--]]

local filleName = "grafo.txt"

local function calculaMenorCaminho (graph, no1, no2)
    local dist = {}
    local visited = {}
    local previous = {}

    -- Inicializa distâncias
    for nodeName, _ in pairs(graph) do
        dist[nodeName] = math.huge
        visited[nodeName] = false
        previous[nodeName] = nil
    end
    dist[no1] = 0

    while true do
        -- Encontra o nó não visitado com menor distância
        local minDist = math.huge
        local current = nil
        for nodeName, d in pairs(dist) do
            if not visited[nodeName] and d < minDist then
                minDist = d
                current = nodeName
            end
        end

        if not current then break end
        visited[current] = true

        -- Atualiza distâncias dos vizinhos
        for _, edge in pairs(graph[current].inc) do
            local neighbor = edge.alv.name
            local weight = tonumber(edge.rot)
            local alt = dist[current] + weight
            if alt < dist[neighbor] then
                dist[neighbor] = alt
                previous[neighbor] = current
            end
        end
    end

    return dist[no2], no1, no2, previous
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
        local namefrom, nameto, rotulo = string.match(line, padrao)
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
            "   %s%s" .. " ---> ", v.name, 
            string.rep(" ", 12 - utf8.len(v.name)
            )))
    for k, v2 in pairs(v.inc) do
        if v2 then
            io.write(string.format(
            " %s (%d)", v2.alv.name, k
            ))
        end
    end
    io.write("\n")
end

print(string.rep("++", 19))
local distancia, no1, no2 =
    calculaMenorCaminho(graph, "Parnaiba", "Cascavel")

print(string.format(
    "Distancia de %s para %s é %d km", no1, no2,distancia))