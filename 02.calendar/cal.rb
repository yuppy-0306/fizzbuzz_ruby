#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'
require 'optparse'

def display_calendar(year, month)
  first_day = Date.new(year, month, 1)
  last_day = Date.new(year, month, -1)
  puts "       #{month}月 #{year}"
  puts "日 月 火 水 木 金 土"
  first_day_offset = first_day.wday
  print '   ' * first_day_offset

  (first_day..last_day).each do |date|
    print date.day.to_s.rjust(2) + ' '
    puts if date.saturday?
  end
  puts
end

options = {}
opt = OptionParser.new

opt.on('-y YEAR', Integer) { |y| options[:year] = y }
opt.on('-m MONTH', Integer) { |m| options[:month] = m }
opt.parse!

year = options[:year] || Date.today.year
month = options[:month] || Date.today.month

display_calendar(year, month)

# 今月のカレンダーを表示するプログラム
# -yで年を指定
# -mで月を指定
# デフォルトは今年の今月のカレンダーが表示される
# 1970年から2100年までのカレンダーを表示する
# 一週間ごとに改行

# 指定された年月の1日から月末まで順番に処理する。
# 各日付が週の何番目の日かを把握し、適切な位置に表示する。
# 週の区切りで改行する。
