 --[[
    Faça um Programa que leia um número inteiro menor que 1000 e imprima a quantidade de centenas,
    dezenas e unidades do mesmo.

    Observando os termos no plural a colocação do "e", da vírgula entre outros. Exemplo:
    326 = 3 centenas, 2 dezenas e 6 unidades
    12 = 1 dezena e 2 unidades Testar com: 326, 300, 100, 320, 310,305, 301, 101, 311, 111, 25, 20,
    10, 21, 11, 1, 7 e 16 
 ]]
 -- pega um número fornecido pelo usuário
 io.write("Digite um número entre 0 e 1000: ")
 Num = tonumber(io.read())

 -- checa se o numero esta no intervalo valido
 if Num > 0 and Num < 1000 then
    -- calcula o numero de centenas, dezenas e unidades do numero digitado
    Mensagem = Num .. " = "
    local cen = Num // 100
    local dez = (Num - 100 * cen) // 10
    local uni = (Num - (100 * cen + 10 * dez))

    if cen ~= 0 then
        Mensagem = Mensagem .. cen .. " centenas"
        if cen == 1 then
            Mensagem = string.gsub(Mensagem, "centenas", "centena")
        end
    end

    if dez ~= 0 then
        if cen ~= 0 then
            if uni ~= 0 then
                Mensagem = Mensagem .. ", "
            else
                Mensagem = Mensagem .. " e "
            end
        end
        Mensagem = Mensagem .. dez .. " dezenas"    
        if dez == 1 then
            Mensagem = string.gsub(Mensagem, "dezenas", "dezena")
        end
    end

    if uni ~= 0 then
        if cen ~= 0 or dez ~= 0 then
            Mensagem = Mensagem .. " e "
        end
        Mensagem = Mensagem .. uni .. " unidades"
        if uni == 1 then
            Mensagem = string.gsub(Mensagem, "unidades", "unidade")
        end
    end

 end

 -- exibe a mensagem
 print(Mensagem)
