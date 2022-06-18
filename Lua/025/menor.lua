 -- Faça um Programa que leia três números e mostre o maior e o menor deles. 

  -- pega três números
  io.write("Digite o 1º número: ")
  N1 = tonumber(io.read())
  io.write("Digite o 2º número: ")
  N2 = tonumber(io.read())
  io.write("Digite o 3º número: ")
  N3 = tonumber(io.read())

  -- verifica o menor é o maior
  Maior = N1
  Menor = N1
  if Maior < N2 then
    Maior = N2
  else
    Menor = N2
  end

  if Maior < N3 then
    Maior = N3
  else
    if Menor > N3 then
        Menor = N3
    end
  end

  -- mostra o maior e menor número digitado
  print("o maior número digitado foi " .. tostring(Maior) .. " e o menor foi " .. tostring(Menor))
