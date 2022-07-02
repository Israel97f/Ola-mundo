 --[[
    Altere o programa anterior permitindo ao usuário informar as populações e as taxas de crescimento
    iniciais. Valide a entrada e permita repetir a operação. 
 ]]

 -- pede ao usuário as informações necessárias
 while true do
    io.write("Digite a população inicial da cidade A: ")
    Populacao_A = tonumber(io.read())
    io.write("Digite a população inicial de cidade B: ")
    Populacao_B = tonumber(io.read())
    io.write("Digite a taxa de crescimento da cidade A: ")
    Taxa_A = tonumber(io.read())
    io.write("Digite a taxa de crescimento da cidade B")
    Taxa_B = tonumber(io.read())

    if Populacao_A > 0 then
      break
    end
 end
