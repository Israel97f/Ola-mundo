--[[
    Faça um programa que peça uma nota, entre zero e dez. Mostre uma mensagem caso o valor seja inválido
    e continue pedindo até que o usuário informe um valor válido.
]]

 -- pede uma nota valida
 while true do
    io.write("Digite uma nota entre 10 e 0: ")
    Nota = tonumber(io.read())
    if Nota <= 10 and Nota >= 0 then
        break
    end
    print("Valor digitado é invalido por favor tente novamente")
 end

 -- exibe nota
 print(Nota)
