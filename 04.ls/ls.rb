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
  return max_entries_width_width
end