--[[
    Faça um programa que leia um nome de usuário e a sua senha e não aceite a senha igual ao nome do
    usuário, mostrando uma mensagem de erro e voltando a pedir as informações.
]]

 -- valida informações necessárias
 while true do
    io.write("Digite um nome de usuário: ")
    Nome = tostring(io.read())
    io.write("Digite uma senha: ")
    Senha = tostring(io.read())
    if Nome ~= Senha then
        break
    end
    print("não é permitido usar o nome de usuário como senha, tente outra vez")
 end
