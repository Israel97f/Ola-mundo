 --[[
    Faça um Programa que leia 2 números e em seguida pergunte ao usuário qual operação ele deseja
    realizar. O resultado da operação deve ser acompanhado de uma frase que diga se o número é:

    par ou ímpar;
    positivo ou negativo;
    inteiro ou decimal.
 ]]

 -- recebe dois números
 io.write("Digite o 1º número: ")
 N1 = tonumber(io.read())
 io.write("Digite o 2° número: ")
 N2 = tonumber(io.read())
 io.write("qual operação dezena realizar s (soma), su (subtrair), d (dividir) ou m (multiplicar): ")
 S = tostring(io.read())

 -- faz a operação selecionada
 if S == "s" then
   Res = N1 + N2
 elseif S == "su" then
   Res = N1 - N2
 elseif S == "d" then
   Res = N1 / N2
 elseif S == "m" then
   Res = N1 * N2
 else 
   print("Operação invalida")
 end
 
 Mensagem = tostring(Res)

 if Res % 2 == 0 then
   Mensagem = Mensagem .. "\n" .. "Par"
 else
   Mensagem = Mensagem .. "\n" .. "Ímpar"
 end
 
 if Res >= 0 then
   Mensagem = Mensagem .. "\n" .."Positivo"
 else
   Mensagem = Mensagem .. "\n" .. "Negativo"
 end

 if Res % 1 == 0 then
   Mensagem = Mensagem .. "\n" .. "Inteiro"
 else
   Mensagem = Mensagem .. "\n" .. "Decimal"
 end

 -- exibe a mensagem
 print(Mensagem)
