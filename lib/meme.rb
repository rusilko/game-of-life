class Meme
  def fornicate(generation)
    new_generation = generation.dup
    generation.each_with_index do |cell, index|
      ids = neighbors(index)
      alive_count = ids.reduce(0) { |acc, id| generation[id] + acc }

      new_generation[index] = 0 if alive_count < 2 || 3 < alive_count
      new_generation[index] = 1 if alive_count == 3
    end

    new_generation
  end

  def neighbors(index)
    row = index / 3
    col = index % 3

    neighbors = []
    (-1..1).each do |r|
      (-1..1).each do |c|
        next if r == 0 && c == 0
        nr = row + r
        nc = col + c
        next if nr < 0 || nc < 0 || nr > 2 || nc > 2
        neighbors << (nr * 3) + (nc)
      end
    end

    neighbors
  end
end
