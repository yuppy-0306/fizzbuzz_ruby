# frozen_string_literal: true

# !/usr/bin/env ruby

entries = Dir.glob('*')

def filter_entries(entries)
  entries.reject do |entry_name|
    entry_name.start_with?('.')
  end
end

visible_entries = filter_entries(entries)

def entries_length_width(entries)
  return 0 if entries.nil? || entries.empty?

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
    grid[row][col] = entry
  end
  grid
end

def print_grid(entries, terminal_width)
  return if entries.empty?

  sorted = entries.sort
  width = entries_length_width(sorted)
  dims = get_grid_dims(sorted, terminal_width, width)
  grid = build_grid(sorted, dims[:num_rows], dims[:num_columns])

  grid.each do |row|
    row.each { |entry| print (entry || '').ljust(width) }
    puts
  end
end

print_grid(visible_entries, TERMINAL_WIDTH)
