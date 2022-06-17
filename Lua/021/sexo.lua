 -- Faça um Programa que verifique se uma letra digitada é "F" ou "M". Conforme a letra escrever:
 -- F - Feminino, M - Masculino, Sexo Inválido. 

 -- Pega a letra fornecida pelo usuário
 io.write("Digite F para feminino ou M para masculino: ")
 Sexo = tostring(io.read())

 -- verifica qual letra foi selecionada
 if Sexo == "F" then
    Selecionado = "Feminino"
 elseif Sexo == "M" then
    Selecionado = "Masculino"
 else
    Selecionado = "Sexo Inválido"
 end

 -- mostra a seleção para o usuário
 print("Foi selecionado " .. Selecionado)
