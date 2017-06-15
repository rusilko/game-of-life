class Cell
  attr_reader :state

  def initialize(state)
    @state = state
  end

  def next_state(neighbors)
    if neighbors < 2
      Cell.new(0)
    elsif neighbors > 3
      Cell.new(0)
    elsif neighbors == 3
      Cell.new(1)
    elsif neighbors == 2
      Cell.new(@state)
    else
      raise "never here"
    end
  end
end

class Game
  def fornicate(generation)
    Generation.new(generation.map { |state| Cell.new(state) }).fornicate.map(&:state)
  end
end

class Generation
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def fornicate
    cells.map.with_index do |cell, index|
      indexes = neighbors(index)
      cell.next_state(indexes.reduce(0) { |acc, i| cells[i].state + acc })
    end
  end

  def neighbors(index)
    row = index / 3
    col = index % 3

    ([-1,0,1].product [-1,0,1]).map do |r,c|
      next if r == 0 && c == 0
      nr = row + r
      nc = col + c
      next if nr < 0 || nc < 0 || nr > 2 || nc > 2
      (nr * 3) + (nc)
    end.compact
  end
end
