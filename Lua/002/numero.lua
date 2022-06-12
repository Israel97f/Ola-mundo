 -- Faça um Programa que peça um número e então mostre a mensagem O número informado foi [número]. 

Number = tonumber(io.read())  -- lê um numero e armazena em Number
print("O número informado foi" .. " " .. tostring(Number))  -- exibe a menssagen
