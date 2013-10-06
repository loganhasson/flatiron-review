# Testing / Assertion
# Define a method that takes two values and compares them, printing pass or fail
def assert_equal(actual, expected)
  actual == expected ? (puts "pass") : (puts "fail")
end

assert_equal(1,1) #=> pass
assert_equal(2,1) #=> fail

# Use assert to test the following:

# define a method to sum the values of an array. Make this method defend against nils and
# other errors

def sum(numbers)
  sum = 0
  numbers.each do |num|
    sum += num if num.is_a?(Integer)
  end
  sum
end

assert_equal sum([]), 0
assert_equal sum([1,2]), 3
assert_equal sum([1,nil,2]), 3
assert_equal sum([1, "2", 2]), 3

# define a method that returns comfortable for temps between 60-80, cold for below and hot
# for above.

def temperature_bot(temp)
  feeling_bad = temp < 60 ? "cold" : "hot"
  (60..80).include?(temp) ? "comfortable" : feeling_bad
end

assert_equal temperature_bot(65), "comfortable"
assert_equal temperature_bot(70), "comfortable"
assert_equal temperature_bot(85), "hot"
assert_equal temperature_bot(30), "cold"

# define an object, Person, that has a birthdate and a name. Define a method for a person
# that returns their age.

class Person
  attr_accessor :name, :birthday, :age

  def age
    birthdate = birthday.split('/').map { |d| d.to_i }
    birth_year = birthdate.last
    birth_month = birthdate.first
    birth_day = birthdate[1]

    year_diff = Time.now.year - birth_year

    if (birth_month == Time.now.month && birth_day > Time.now.day) || birth_month > Time.now.month
      year_diff -= 1
    end

    @age = year_diff
  end
end

begin
  person = Person.new
  person.name = "Alan Turing"
  person.birthday = "06/23/1912"

  assert_equal person.name, "Alan Turing"
  assert_equal person.birthday, "06/23/1912"
  assert_equal person.age, 101

rescue => e
  puts "Fail: #{e}"
end