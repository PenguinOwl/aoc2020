#! /usr/bin/crystal

input = File.read("input.txt").strip

entries = input.split("\n").map{|e| e.to_i}

bottom = 0
top = entries.size - 1

entries.each_with_index do |num1, i|
  entries[(i+1)..-1].each do |num2|
    entries[(i+2)..-1].each do |num3|
      if num1 + num2 + num3 == 2020
        puts num1 * num2 * num3
        exit
      end
    end
  end
end
