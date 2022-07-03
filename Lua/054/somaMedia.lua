 -- Faça um programa que leia 5 números e informe a soma e a média dos números. 

 -- pega 5 número e calcula a soma entre eles:
 Tabela = {0, 0, 0, 0, 0}
 Soma = 0
 for i = 1, 5, 1 do
    io.write("Digite o " .. i .. "° número: ")
    Tabela[i] = tonumber(io.read())

    Soma = Soma + Tabela[i]

 end

 -- calcula a média
 Media = Soma / 5

 -- exibe a Soma e a média dos números coletados
 print("A soma dos números informados é " .. Soma .. " e a media é " .. Media)
