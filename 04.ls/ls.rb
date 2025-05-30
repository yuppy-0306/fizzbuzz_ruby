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

visible_entries = filter_entries(all_entries)
visible_entries.each do |entry|
  puts entry
end




