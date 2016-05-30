# tableIO
Writes Lua table to (not necessarily) .lua file, using io functions.

It writes all (key,value) pairs where value is of any of these types:
* `number`
* `string`
* `boolean`.

Values of type `function` or `nil` will be skipped (not written).

Tables saved as .lua can be read using `require`.

##Usage
tableIO contains a single function to be called, `tableIO.save`:

Parameters:
* t: a reference to the table to be written
* path: a string represeting where the file should be saved, needs the extension (.lua,.txt,etc)
* (OPTIONAL) name: a string with the name the table will have on the file, default is 'table'

Returns:
* boolean: whether or not the save operation was successfull
* string: when not successfull, the error message, otherwise, nil

####Saving
Simply require the script and call the save function:
```Lua
  local tableIO = require 'tableIO'
  tableIO.save({key1 = 20, key2 = 'hello_world'},'myPath.lua')
```
####Reading
Require the file, using the path where it was saved
```Lua
  local myTable = require 'myPath'
```

##Example
A more complete example is in `main.lua`
