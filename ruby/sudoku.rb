#!/usr/bin/env ruby

module Sudoku
  def self.cross(a, b)
    a.product(b).map {|x| x.join }
  end

  def self.boxes(rows, cols)
    rows.each_slice(3).map {|rs|
      cols.each_slice(3).map {|cs| cross(rs, cs) }
    }.flatten(1)
  end

  def self.square_units(unitlist, square)
    unitlist.select {|u| u.include? square }
  end

  def self.square_peers(units, square)
    units[square].flatten.uniq - [square]
  end

  DIGITS = COLS = ('1'..'9').to_a
  ROWS = ('A'..'I').to_a
  SQUARES = cross(ROWS, COLS)
  UNITLIST = COLS.map {|c| cross(ROWS, [c]) } + 
    ROWS.map {|r| cross([r], COLS) } +
    boxes(ROWS, COLS)
  UNITS = Hash[SQUARES.map {|s| [s, square_units(UNITLIST, s)] }]
  PEERS = Hash[SQUARES.map {|s| [s, square_peers(UNITS, s)] }]

  def self.parse_grid(grid)
    values = Hash[SQUARES.map {|s| [s, DIGITS] }]
    grid_values(grid).each do |s, d|
      return false if DIGITS.include?(d) and not assign(values, s, d)
    end
    values
  end

  def self.grid_values(grid)
    chars = grid.each_char.select {|c| DIGITS.include?(c) or '0.'.include?(c) }
    raise unless chars.size == 81
    Hash[SQUARES.zip(chars)]
  end

  def self.assign(values, s, d)
    other_values = values[s].delete(d)
    if other_values.all? {|d2| eliminate(values, s, d2) }
      return values
    else
      return false
    end
  end

  def self.eliminate(values, s, d)
    return values if not values[s].include? d
    values[s] = values[s].delete(d)

    if values[s].size == 0
      return false
    elsif values[s].size == 1
      d2 = values[s]
      return false if not PEERS[s].all? {|s2| eliminate(values, s2, d2) }
    end

    UNITS[s].each do |u|
      dplaces = u.select {|s| values[s].include? d }
      if dplaces.size == 0
        return false
      elsif dplaces.size == 1
        if not assign(values, dplaces[0], d)
          return false
        end
      end
      return values
    end
  end
end
