 -- Faça um Programa que verifique se uma letra digitada é vogal ou consoante. 


 -- cria uma tabela de vogais
 Vog = "AaEeIiOoUu"

 -- pede uma letra ao usuário
 io.write("digite uma letra: ")
 Letra = tostring(string.sub(io.read(), 1, 1))

 -- verifica se aletra digitada faz parte das vogais
 if string.match(Vog, Letra) ~= nil then
    Tipo = "vogal"
 else
    Tipo = "consoante"
 end

 -- mostra o resultado para o usuário
 print("A letra '" .. Letra .. "' é uma " .. Tipo)
