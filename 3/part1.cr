#! /usr/bin/crystal

input = File.read("input.txt").strip

lines = input.split("\n")

grid = lines.map do |line|
  chars = line.split("")
  next chars.map{|e| e == "#"}
end

x = 0
y = 0
trees = 0

width = grid[0].size

loop do
  x += 3
  x %= width
  y += 1
  if row = grid[y]?
    unless row[x]?.nil?
      value = row[x]
      if value
        trees += 1
      end
    else
      raise "x overflow"
    end
  else
    break
  end
end

puts trees
