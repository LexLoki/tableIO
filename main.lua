local tableIO = require('tableIO')

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

tableIO.save(tableToBeSaved,'savedTable.lua')