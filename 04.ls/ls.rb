# frozen_string_literal: true

# !/usr/bin/env ruby

def entries_length_width(entries)
  return 0 if entries.nil? || entries.empty?

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

def print_grid(entries, terminal_width, reverse: false)
  sorted = entries.sort
  sorted.reverse! if reverse
  width = entries_length_width(sorted)
  _, num_rows = get_grid_dims(sorted, terminal_width, width)
  grid = build_grid(sorted, num_rows)
  grid.each do |row|
    puts row.map { |entry| entry.ljust(width) }.join
  end
end

include_hidden = ARGV.include?('-a')
reverse = ARGV.include?('-r')

entries = Dir.glob('*', include_hidden ? File::FNM_DOTMATCH : 0)

print_grid(entries, TERMINAL_WIDTH, reverse:)
