 --[[
    Faça um Programa para um caixa eletrônico. O programa deverá perguntar ao usuário a valor do saque e
    depois informar quantas notas de cada valor serão fornecidas. As notas disponíveis serão as de 1, 5,
    10, 50 e 100 reais. O valor mínimo é de 10 reais e o máximo de 600 reais. O programa não deve se pre-
    ocupar com a quantidade de notas existentes na máquina.

    Exemplo 1: Para sacar a quantia de 256 reais, o programa fornece duas notas de 100, uma nota de 50,
    uma nota de 5 e uma nota de 1;
    Exemplo 2: Para sacar a quantia de 399 reais, o programa fornece três notas de 100, uma nota de 50,
    quatro notas de 10, uma nota de 5 e quatro notas de 1.
 ]]

 -- pede ao usuário o valor de saque
 io.write("Digite o valor de saque: ")
 Valor = tonumber(io.read())

 -- verifica quais notas serão sacadas
 if Valor >= 10 and Valor <= 600 then
    N100 = Valor // 100
    N50 = (Valor - N100 * 100) // 50
    N10 = (Valor - N100 * 100 - N50 * 50) // 10
    N5 = (Valor - N100 * 100 - N50 * 50 - N10 * 10) // 5
    N1 = (Valor - N100 * 100 - N50 * 50 - N10 * 10 - N5 * 5)

    Numeros = {"uma", "duas", "três", "quatro", "cinco", "seis", "sete", "oito", "nove"}

    Mensagem = "O valor de R$ " .. string.format("%.2f", Valor) .. " será sacado em: "

    if N100 ~= 0 then
        if N100 == 1 then
            Nota = " nota" 
        else
            Nota = " notas"
        end
        Mensagem = Mensagem .. Numeros[N100] .. Nota .. " de 100"
    end

    if N50 ~= 0 then
        if N50 == 1 then
            Nota = " nota"
        else
            Nota = " notas"
        end
        if N100 ~= 0 then
            if N1 == 0 and N5 == 0 and N10 == 0 then
                Sep = " e "
            else
                Sep = ", "
            end
        else
            Sep = ""
        end
        Mensagem = Mensagem .. Sep .. Numeros[N50] .. Nota .. " de 50"
    end

    if N10 ~= 0 then
        if N10 == 1 then
            Nota = " nota"
        else
            Nota = " notas"
        end
        if N100 ~= 0 or N50 ~= 0 then
            if N1 == 0 and N5 == 0 then
                sep = " e "
            else
                Sep = ", "
            end
        else
            Sep = ""
        end
        Mensagem = Mensagem .. Sep .. Numeros[N10] .. Nota .. " de 10"
    end

    if N5 ~= 0 then
        if N5 == 1 then
            Nota = " nota"
        else
            Nota = " notas"
        end
        if N100 ~= 0 or N50 ~= 0 or N10 ~= 0 then
            if N1 == 0 then
                Sep = " e "
            else
                Sep = ", "
            end
        else
            Sep = ""
        end
        Mensagem = Mensagem .. Sep .. Numeros[N5] .. Nota .. " de 5"
    end

    if N1 ~= 0 then
        if N1 == 1 then
            Nota = " nota"
        else
            Nota = " notas"
        end
        if N100 ~= 0 or N50 ~= 0 or N10 ~= 0 or N5 ~= 0 then
            Sep = " e "
        else
            Sep = ""
        end
        Mensagem = Mensagem .. Sep .. Numeros[N1] .. Nota .. " de 1"
    end
 else
    Mensagem = "Valor invalido"
 end
 -- exibe a mensagem para o usuário
 print(Mensagem)
