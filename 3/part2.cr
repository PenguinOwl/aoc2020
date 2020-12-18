#! /usr/bin/crystal

input = File.read("input.txt").strip

lines = input.split("\n")

grid = lines.map do |line|
  chars = line.split("")
  next chars.map{|e| e == "#"}
end

def check_slope(x_slope, y_slope, grid)
  x = 0
  y = 0
  trees = 0

  width = grid[0].size

  loop do
    x += x_slope
    x %= width
    y += y_slope
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
  return trees
end

puts [
  check_slope(1, 1, grid),
  check_slope(3, 1, grid),
  check_slope(5, 1, grid),
  check_slope(7, 1, grid),
  check_slope(1, 2, grid),
].map(&.to_u64).product
