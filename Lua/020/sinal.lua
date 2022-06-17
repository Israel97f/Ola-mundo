 -- Faça um Programa que peça um valor e mostre na tela se o valor é positivo ou negativo. 

 -- pega um numero fornecido pelo usuário
 io.write("Digite um numero: ")
 N1 = tonumber(io.read())

 if N1 >= 0 then Sinal = "positivo" else Sinal = "negativo" end

  -- mostra o resultado para o usuário
  print("O numero fornecido é " .. Sinal)
  