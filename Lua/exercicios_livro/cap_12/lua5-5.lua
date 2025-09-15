X = 10
Y = 786.30000000001
local tabela = table.create(3, 6)

print(#tabela)

print(string.format("%d  %f", X, X))
print(Y)

for i = 1, 4 do
    tabela[i] = i
end

for i = 1, #tabela do
    print(i)
end
