# frozen_string_literal: true

# !/usr/bin/env ruby

def entries_length_width(entries)
  return 0 if entries.blank?

  max_length = entries.map(&:length).max
  max_length + 2
end

TERMINAL_WIDTH = 80

def get_grid_dims(entries, terminal_width, max_entries_width)
  return [0, 0] if entries.empty?

  max_entries_width = [1, max_entries_width].max
  num_columns = [1, (terminal_width / max_entries_width).floor].max
  num_rows = entries.size.ceildiv(num_columns)
  [num_columns, num_rows]
end

def build_grid(entries, num_rows)
  columns = entries.each_slice(num_rows).to_a
  columns.last&.fill('', columns.last.size...num_rows)
  columns.transpose
end

def print_grid(entries, terminal_width)
  sorted = entries.sort
  width = entries_length_width(sorted)
  num_columns, num_rows = get_grid_dims(sorted, terminal_width, width)
  grid = build_grid(sorted, num_rows, num_columns)

  grid.each do |row|
    puts row.map { |entry| entry.ljust(width) }.join
  end
end

# メイン処理
entries = Dir.glob('*')
print_grid(entries, TERMINAL_WIDTH)
