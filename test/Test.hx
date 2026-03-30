import llua.Lua;
import llua.LuaL;
import llua.State;

class Test {
	static function main() {
		trace("=== LuaJIT Binding Tests ===\n");

		var vm:State = LuaL.newstate();
		LuaL.openlibs(vm);

		// Test 1: Version info
		trace("\nTest 1: Version Information");
		trace("Lua version: " + Lua.version());
		trace("LuaJIT version: " + Lua.versionJIT());

		// Test 2: Load and execute Lua file
		trace("\nTest 2: Loading Lua Script");
		LuaL.dofile(vm, "script.lua");

		// Test 3: Call Lua function with parameters
		trace("\nTest 3: Calling Lua Functions");
		Lua.getglobal(vm, "foo");
		Lua.pushinteger(vm, 1);
		Lua.pushnumber(vm, 2.0);
		Lua.pushstring(vm, "three");
		Lua.pcall(vm, 3, 0, 0);

		// Test 4: Call function that returns a value
		trace("\nTest 4: Functions with Return Values");
		Lua.getglobal(vm, "add");
		Lua.pushinteger(vm, 5);
		Lua.pushinteger(vm, 3);
		Lua.pcall(vm, 2, 1, 0);
		var result = Lua.tointeger(vm, -1);
		trace("add(5, 3) = " + result);
		Lua.pop(vm, 1);

		// Test 5: Working with tables
		trace("\nTest 5: Table Operations");
		Lua.getglobal(vm, "data");
		Lua.getfield(vm, -1, "name");
		var name = Lua.tostring(vm, -1);
		trace("data.name = " + name);
		Lua.pop(vm, 2);

		Lua.getglobal(vm, "data");
		Lua.getfield(vm, -1, "value");
		var value = Lua.tointeger(vm, -1);
		trace("data.value = " + value);
		Lua.pop(vm, 2);

		// Test 6: Call math function
		trace("\nTest 6: Math Operations");
		Lua.getglobal(vm, "multiply");
		Lua.pushnumber(vm, 7.5);
		Lua.pushnumber(vm, 4.0);
		Lua.pcall(vm, 2, 1, 0);
		var mathResult = Lua.tonumber(vm, -1);
		trace("multiply(7.5, 4.0) = " + mathResult);
		Lua.pop(vm, 1);

		// Test 7: Test string concatenation
		trace("\nTest 7: String Operations");
		Lua.getglobal(vm, "concat");
		Lua.pushstring(vm, "Hello");
		Lua.pushstring(vm, "World");
		Lua.pcall(vm, 2, 1, 0);
		var strResult = Lua.tostring(vm, -1);
		trace("concat('Hello', 'World') = " + strResult);
		Lua.pop(vm, 1);

		// Test 8: Conditional logic
		trace("\nTest 8: Conditional Logic");
		Lua.getglobal(vm, "abs_val");
		Lua.pushinteger(vm, -42);
		Lua.pcall(vm, 1, 1, 0);
		var absResult = Lua.tointeger(vm, -1);
		trace("abs_val(-42) = " + absResult);
		Lua.pop(vm, 1);

		// Test 9: Multiple return values
		trace("\nTest 9: Multiple Return Values");
		Lua.getglobal(vm, "divide_with_remainder");
		Lua.pushinteger(vm, 17);
		Lua.pushinteger(vm, 5);
		Lua.pcall(vm, 2, 2, 0);
		var quotient = Lua.tointeger(vm, -2);
		var remainder = Lua.tointeger(vm, -1);
		trace("divide_with_remainder(17, 5) = quotient: " + quotient + ", remainder: " + remainder);
		Lua.pop(vm, 2);

		// Test 10: Array/list operations
		trace("\nTest 10: Array Operations");
		Lua.getglobal(vm, "numbers");
		Lua.rawgeti(vm, -1, 1);
		var first = Lua.tointeger(vm, -1);
		trace("numbers[1] = " + first);
		Lua.pop(vm, 1);

		Lua.rawgeti(vm, -1, 2);
		var second = Lua.tointeger(vm, -1);
		trace("numbers[2] = " + second);
		Lua.pop(vm, 1);

		Lua.rawgeti(vm, -1, 3);
		var third = Lua.tointeger(vm, -1);
		trace("numbers[3] = " + third);
		Lua.pop(vm, 2);

		trace("\nAll tests completed\n");

		Lua.close(vm);
	}
}
