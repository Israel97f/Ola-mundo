 --[[
    A série de Fibonacci é formada pela sequência 1,1,2,3,5,8,13,21,34,55,... Faça um programa capaz
    de gerar a série até o n−ésimo termo.
 ]]

 -- pega número equivalente ao enésimo termo a ser calculado na sequencia de Fibonacci
 io.write("Digite quantos termos da sequencia de Fibonacci deseja: ")
 N = tonumber(io.read())
 Fn = 0
 Fn1 = 1
 Fn2 = 0

 -- calcula a sequencia de Fibonacci
 SeFibonacci = {}
 if N == 0 then
    Fn = 0
    table.insert(SeFibonacci, Fn)
 elseif N == 1 then
    Fn = 1
    table.insert(SeFibonacci, 0)
    table.insert(SeFibonacci, Fn)
 else
    Fn1 = 1
    Fn2 = 0
    SeFibonacci = {Fn2, Fn1}
    for i = 2, N do
        Fn = Fn1 + Fn2
        Fn2 = Fn1
        Fn1 = Fn
        table.insert(SeFibonacci, Fn)
    end
 end

 -- exibe sequencia gerada
 io.write("A sequencia gerada é: ")
 for i, j in pairs(SeFibonacci) do
    io.write(j .. " ")
 end
 print("")
 