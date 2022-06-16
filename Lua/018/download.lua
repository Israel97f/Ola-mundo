--[[
    Faça um programa que peça o tamanho de um arquivo para download (em MB) e a velocidade de um link 
    de Internet (em Mbps), calcule e informe o tempo aproximado de download do arquivo usando este 
    link (em minutos). 
]]

 -- coleta as informações necessárias do usuário
 io.write("Digite o tamanho do arquivo em MB: ")
 Arquivo = tonumber(io.read())
 io.write("Qual a velocidade do link em (Mbps): ")
 Velocidade = tonumber(io.read())

 -- calcule o tempo de download
 Tempo = Arquivo * 8 / Velocidade / 60
 if Tempo // 1 ~= 0 then Tempo = Tempo // 1 + 1 end
 
 -- exibe o tempo calculado para o usuário
 print("O tempo de download do arquivo com tamanho de " .. tostring(Arquivo) .. " MB é " ..tostring(Tempo) .. " min") 
    