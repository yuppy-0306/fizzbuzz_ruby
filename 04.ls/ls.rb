# frozen_string_literal: true

# !/usr/bin/env ruby

Dir.pwd

def filter_entries(entries)
  entries.reject do |entry_name|
    entry_name == '.' ||
      entry_name == '..' ||
      entry_name.start_with?('.')
  end
end

example = ['index.html', 'a.img', 'b.img', 'c.img']

visible_entries = filter_entries(example)
sorted_visible_entries = visible_entries.sort
sorted_visible_entries.each do |entry|
  puts entry
end

def entries_length_width(entries)
  return 0 if entries.empty?

  max_length = entries.map(&:length).max
  max_length + 2
end

TERMINAL_WIDTH = 80

def get_grid_dims(entries, terminal_width, max_entries_width)
  return { num_columns: 0, num_rows: 0 } if entries.empty?

  max_entries_width = [1, max_entries_width].max
  num_columns = (terminal_width / max_entries_width).floor
  num_columns = [1, num_columns].max
  num_rows = (entries.size.to_f / num_columns).ceil
  { num_columns: num_columns, num_rows: num_rows }
end

def build_grid(entries, num_rows, num_columns)
  grid = Array.new(num_rows) { Array.new(num_columns) }
  entries.each_with_index do |entry, index|
    row = index % num_rows
    col = index / num_rows
    grid[row][col] = entry if col < num_columns
  end
  grid
end

def print_grid(entries, terminal_width)
  return if entries.empty?

  sorted_entries = entries.sort
  max_entries_width = entries_length_width(sorted_entries)
  dimensions = get_grid_dims(sorted_entries, terminal_width, max_entries_width)
  num_columns = dimensions[:num_columns]
  num_rows = dimensions[:num_rows]
  grid = build_grid(sorted_entries, num_rows, num_columns)

  (0...num_rows).each do |row|
    (0...num_columns).each do |col|
      entry = grid[row][col]
      if entry
        print entry.ljust(max_entries_width)
      else
        print ' '.ljust(max_entries_width)
      end
    end
    puts
  end
end
