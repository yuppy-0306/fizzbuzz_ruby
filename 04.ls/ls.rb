#!/usr/bin/env ruby

current_directory = Dir.pwd
all_entries = Dir.children(current_directory)

def filter_entries(entries)
  entries.reject do |entry_name|
    entry_name == "." ||         
    entry_name == ".." ||        
    entry_name.start_with?(".")  
  end
end

example=["index.html", "a.img", "b.img", "c.img"]

visible_entries = filter_entries(example)
sorted_visible_entries = visible_entries.sort
sorted_visible_entries.each do |entry|
  puts entry
end

def entries_length_width(entries)
    return 0 if entries.empty?
    max_length = entries.map(&:length).max
    max_entries_width = max_length + 2
  return max_entries_width
end

TERMINAL_WIDTH = 80

def get_grid_dims (entries, terminal_width, max_entries_width)
  return { num_columns: 0, num_rows: 0 } if entries.empty?
  max_entries_width = [1,max_entries_width].max
  num_columns = (terminal_width/max_entries_width).floor
  num_columns = [1,num_columns].max
  num_rows = (entries.size.to_f / num_columns).ceil
  { num_columns: num_columns,num_rows: num_rows}
end