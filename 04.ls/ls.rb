#!/usr/bin/env ruby
current_directory = Dir.pwd

children = Dir.children(current_directory)
children.each do |child|
  puts child
end