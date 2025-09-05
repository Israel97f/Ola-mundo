-- Modifique o programa das oito rainhas a fim de que ele pare depois de imprimir a primeira
-- solução.

local N = 8
-- tamanho do tabuleiro
local contador = 0 -- conta quantas vezes isplaceok foi chamada
-- verifica se a posição (n,c) está livre de ataques
local function isplaceok (a, n, c)
    contador = contador + 1
    for i = 1, n - 1 do
        -- para cada rainha já posicionada
        if (a[i] == c) or
            -- mesma coluna?
            (a[i] - i == c - n) or
            -- mesma diagonal?
            (a[i] + i == c + n) then
            -- mesma diagonal?
            return false
            -- o local pode ser atacado
        end
    end
    return true
-- sem ataques; o local está OK
end

-- imprime um tabuleiro
local function printsolution (a)
    for i = 1, N do
        for j = 1, N do
            io.write(a[i] == j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

--[[ adiciona ao tabuleiro 'a' todas as rainhas de 'n' a 'N' - original
local function addqueen (a, n)
    if n > N then
        -- todas as rainhas foram posicionadas?
        printsolution(a)
    else -- tenta posicionar a n-ésima rainha
        for c = 1, N do
            if isplaceok(a, n, c) then
                a[n] = c
                -- posiciona a n-ésima rainha na coluna 'c'
                addqueen(a, n + 1)
            end
        end
    end
end
--]]

---[[ adiciona ao tabuleiro 'a' todas as rainhas de 'n' a 'N' Modificado
local function addqueen (a, n)
    if n > N then
        -- todas as rainhas foram posicionadas?
        printsolution(a)
        coroutine.yield()
    else -- tenta posicionar a n-ésima rainha
        for c = 1, N do
            if isplaceok(a, n, c) then
                a[n] = c
                -- posiciona a n-ésima rainha na coluna 'c'
                addqueen(a, n + 1)
            end
        end
    end
end
--]]


local co = coroutine.create(addqueen)

-- executa o programa
coroutine.resume(co, {}, 1)
--addqueen({}, 1)
print(contador)
