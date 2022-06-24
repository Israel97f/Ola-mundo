 -- Faça um Programa que peça uma data no formato dd/mm/aaaa e determine se a mesma é uma data válida.


 -- pede uma data no formato dd/mm/aaaa
 io.write("Digite uma data (dd/mm/aaaa): ")
 Data = tostring(io.read())

 -- verifica se a data informada é valida
 Mensagem = "Data Invalida"
 if #(Data) == 10 and string.sub(Data, 3, 3) == "/" and string.sub(Data, 6, 6) == "/" then
    local dia = tonumber(string.sub(Data, 1, 2))
    local mes = tonumber(string.sub(Data, 4, 5))
    local ano = tonumber(string.sub(Data, 7, 10))
    local bissexto = nil

    -- checa se o ano é bissexto
    if ano % 4  == 0 and ano % 100 ~= 0 or ano % 400 == 0 then
        bissexto = true
    else
        bissexto = false
    end
    -- define o ultimo dia valido de cada mês
    if string.sub("04 06 09 11", tostring(mes)) ~= nil then
        DiaLimite = 30
    else
        DiaLimite = 31

        if mes == 02 then
            if bissexto then
                DiaLimite = 29
            else
                DiaLimite = 28
            end
        end 
    end


    if dia <= DiaLimite and dia > 0 and mes <= 12 and mes > 0 then
        Mensagem = "Data valida"        
    end  
 end

 -- exibe a mensagem
 print(Mensagem)
