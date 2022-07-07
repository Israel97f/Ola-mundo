 -- A série de Fibonacci é formada pela sequência 0,1,1,2,3,5,8,13,21,34,55,... Faça um programa
 -- que gere a série até que o valor seja maior que 500. 

 -- gera a sequencia de Fibonacci até o valor limite
 Fibonacci = {0, 1}
 Fn1 = 1
 Fn2 = 0
 while true do
    Fn = Fn1 + Fn2
    Fn2 = Fn1
    Fn1 = Fn
    table.insert(Fibonacci, Fn)
    if Fn > 500 then
        break
    end
 end

 -- exibe a sequencia (opi)
 io.write("A sequência gerada é: ")
 for i, j in pairs(Fibonacci) do
    io.write(j .. ", ")
 end
