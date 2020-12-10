#! /usr/bin/crystal

input = File.read("input.txt").strip

lines = input.split("\n")

passwords = lines.map do |e|
  match = e.match(/([0-9]+)-([0-9]+) (\w): (\w+)/).not_nil!
  next {
    match[1].to_i,
    match[2].to_i,
    match[3][0],
    match[4]
  }
end

invalid_passwords = 0

passwords.each do |password|
  number_of_chars = password[3].count(password[2])
  unless number_of_chars < password[0] || number_of_chars > password[1]
    invalid_passwords += 1
  end
end

puts invalid_passwords
