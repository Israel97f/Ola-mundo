 --[[
    Faça um programa que leia e valide as seguintes informações:

    Nome: maior que 3 caracteres;
    Idade: entre 0 e 150;
    Salário: maior que zero;
    Sexo: 'f' ou 'm';
    Estado Civil: 's', 'c', 'v', 'd'; 
 ]]

 -- pega e valida os dados necessários
 while true do
    io.write("Digite seu nome: ")
    Nome = tostring(io.read())
    io.write("Digite sua idade: ")
    Idade = tonumber(io.read())
    io.write("Digite seu salário: ")
    Salario = tonumber(io.read())
    io.write("Digite seu sexo: ")
    Sexo = tostring(io.read())
    io.write("Digite seu estado civil: ")
    Estado = tostring(io.read())

    if #(Nome) > 3 and Idade >= 0 and Idade <= 150 and Salario > 0 then
        if Sexo == "f" or Sexo == "m" and string.match("scvd", Estado ) ~= nil then
            break
        end
    end
    print("uma ou mais informações digitadas não são validas, por favor tente de novo")
 end
