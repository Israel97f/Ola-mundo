local lib = require("soma_valores")

print(lib.soma_t({1, 2.5, 3}))               -- Deve imprimir: 6.5
print(lib.soma_t({a = 10, b = 20}))          -- Deve imprimir: 30
print(lib.soma_t({1, "2", 3, "texto", 4.5})) -- Deve imprimir: 8.5

--- Saida no console ---
--[[
2.5
0.0
4.5
--]]