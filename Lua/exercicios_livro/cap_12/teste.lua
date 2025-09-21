local dados = {}
function entrada (tabela)
    table.insert(dados, tabela)
end

dofile("dados.data")


for _, v in pairs(dados[1]) do
    print(v)
end


local d = {10, 20, 30 , 40, 50, ["1"] = 60,}

print(d[1], d["1"])