# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
	str.each_char do |char|
		if char == char.downcase
			str.delete!(char)
		end
	end
	str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
	mid = str.length/2
	if str.length.odd?
		return str[mid]
	else
		return str[mid-1..mid]
	end
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
	str.downcase.count("aeiou")
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
	result = 1
	(1..num).each do |i|
		result *= i
	end
	result
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
	str = ""
	arr.each_index do |i|
		str += arr[i].to_s
		str += separator unless i == arr.length - 1
	end
	str
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
	result = ""
	str.chars.each_index do |i|
		if i.even?
			result += str[i].downcase
		else
			result += str[i].upcase
		end
	end
	result
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
	results = []
	str.split.map do |word|
		if word.length > 4
			word = word.reverse
		end
		results.push(word)
	end
	results.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
	result = []
	(1..n).each do |i|
		if i % 15 == 0
			result.push("fizzbuzz")
		elsif i % 5 == 0
			result.push("buzz")
		elsif i % 3 == 0
			result.push("fizz")
		else
			result.push(i)
		end
	end
	result
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
	result = []
	arr.each do |elem|
		result.unshift(elem)
	end
	result
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
	if num == 1
		return false
	elsif num == 2
		return true
	end

	(2..num/2).each do |i|
		if num % i == 0
			return false
		end
	end
	true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
	result = []
	(1..num).each do |i|
		if num % i == 0
			result << i
		end
	end
	result
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
	result = []
	factors(num).each do |factor|
		if prime?(factor)
			result << factor
		end
	end
	result
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
	prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
	evens = []
	odds = []
	arr.each do |num|
		if num.odd?
			odds << num
		else
			evens << num
		end
	end
	if evens.length == 1
		return evens.first
	else
		return odds.first
	end
end
