#! /usr/bin/crystal

input = File.read("input.txt").strip

entries = input.split("\n").map{|e| e.to_i}

bottom = 0
top = entries.size - 1

entries.each_with_index do |e, i|
  entries[(i+1)..-1].each do |num|
    if e + num == 2020
      puts e * num
      exit
    end
  end
end
