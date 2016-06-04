local function printTable(t,offset)
	offset = offset or ''
	for i,v in pairs(t) do
		if(type(v)=='table') then
			print(offset ..i ..' :')
			printTable(v,offset..'\t')
		else
			print(offset ..i ..' : '..tostring(v))
		end
	end
end

local tableToBeSaved = {
	i_am_boolean = true,
	name = 'myTable',
	randomNumbers = {},
	point = {
		x=0, y=0, z=0, label = 'originPoint'
	}
}

for i=1,10 do
	table.insert(tableToBeSaved.randomNumbers,math.random(50))
end

local tableIO = require('tableIO')
--Saving table to .lua file
tableIO.save(tableToBeSaved,'savedTable.lua')

local p = io.open('savedTable.txt','w')
--Getting string selrialization and writing it
p:write(tableIO.tableToString(tableToBeSaved))
p:close()

--Getting back the string serialization
p = io.open('savedTable.txt','r')
local str = p:read('*all')
p:close()

--Getting .lua table with require
local tableRead = require 'savedTable'
--Geting table from deserialization
local tableRead2 = tableIO.stringToTable(str)

print('\nTable from .lua')
printTable(tableRead)
print('\nTable from .txt')
printTable(tableRead2)