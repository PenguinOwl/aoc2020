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

valid_passwords = 0

passwords.each do |password|
  pp password
  content = password[3]
  first_char = content[password[0]-1]
  second_char = content[password[1]-1]
  match_char = password[2]
  first_match = first_char == match_char
  second_match = second_char == match_char
  if (first_match || second_match) && !(first_match && second_match)
    valid_passwords += 1
  else
    print first_char, " ", second_char, " ", first_match, " ", second_match, "\n"
  end
end

puts valid_passwords
