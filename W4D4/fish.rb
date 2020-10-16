def sluggish_octopus(fish_array)
  fish_array.each do |fish|
    return fish if fish_array.all?{|f| f.length <= fish.length}
  end
end

def dominant_octopus(fish_array)
  fish_array.sort_by(&:length).last
end

def clever_octopus(fish_array)
  max_length = fish_array.first.length
  idx = 0
  (1...fish_array.length).each do |i|
    if fish_array[i].length > max_length
      max_length = fish_array[i].length
      idx = i
    end
  end
  fish_array[idx]
end
fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish_octopus(fish_array)
p dominant_octopus(fish_array)
p clever_octopus(fish_array)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, array)
  array.index(dir)
end
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

hash = tiles_array.each_with_index.inject(Hash.new(0)) {|a,(e,i)| a[e] = i; a}

def fast_dance(dir, hash)
  hash[dir]
end


p fast_dance("up", hash)
p fast_dance("right-down", hash)

