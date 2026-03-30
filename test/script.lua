-- Basic function test
function foo(i, f, s)
	print("Called foo(), i = " .. i .. ", f = " .. f .. ", s = '" .. s .. "'")
end

-- Addition function
function add(a, b)
	return a + b
end

-- Multiplication function
function multiply(a, b)
	return a * b
end

-- String concatenation function
function concat(s1, s2)
	return s1 .. " " .. s2
end

-- Absolute value function
function abs_val(n)
	if n < 0 then
		return -n
	else
		return n
	end
end

-- Division with remainder
function divide_with_remainder(dividend, divisor)
	local quotient = math.floor(dividend / divisor)
	local remainder = dividend % divisor
	return quotient, remainder
end

-- Data table
data = {
	name = "TestData",
	value = 42,
}

-- Array of numbers
numbers = { 10, 20, 30 }

print("script.lua loaded successfully!")
