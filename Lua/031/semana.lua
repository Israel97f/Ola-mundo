 --[[ 
    Faça um Programa que leia um número e exiba o dia correspondente da semana. (1-Domingo, 2- Segunda,
    etc.), se digitar outro valor deve aparecer valor inválido.
 ]] 


 -- Lê um número
 io.write("Digite um número: ")
 Num = tonumber(io.read())

 -- relaciona o numero ao dia da semana
 if Num == 1 then
    Dia = "Domingo"
 elseif Num == 2 then
    Dia = "Segunda"
 elseif Num == 3 then
    Dia = "Terça"
 elseif Num == 4 then
    Dia = "Quarta"
 elseif Num == 5 then
    Dia = "Quinta"
 elseif Num == 6 then
    Dia = "Sexta"
 elseif Num == 7 then
    Dia = "Sábado"
 else
    Dia = "Valor inválido"
 end

 -- mostra a o Dai para o usuário
 print(Dia)
