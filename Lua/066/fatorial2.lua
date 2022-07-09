 -- Altere o programa de cálculo do fatorial, permitindo ao usuário calcular o fatorial várias vezes
 -- e limitando o fatorial a números inteiros positivos e menores que 16. 

 -- pega um número valido
 while true do
    while true do
        io.write("Digite um número inteiro entre 0 e 16 no qual deseja calcular o fatorial: ")
        N = tonumber(io.read())
        if N <= 16 and N >= 0 and math.type(N) == "integer" then
            break
        end 
        print("O número digitado não é valido, por favor tente outra vez")
    end
    if N == 0 then
        Fatorial = 0
    else
        Fatorial = N
        for i = N - 1, 1, -1 do
            Fatorial = Fatorial * i
        end
    end
    -- exibe o fatorial calculado
    print("O fatorial de " .. N .. " é " .. Fatorial)

    -- verifica se o usuário deseja repetir
    io.write("Deseja repetir a operação s/n ?: ")
    local res = tostring(io.read())

    if string.match("Nn", res) ~= nil then
        break
    end
 end