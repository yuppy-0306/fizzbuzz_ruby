#!/usr/bin/env ruby
require 'date'
require 'optparse'

def display_calendar(year,month)
    first_day = Date.new(year, month, 1)
    last_day = Date.new(year,month,-1)
    printf "       #{month}月 #{year}\n"
    printf " 日 月 火 水 木 金 土\n"
    indent = first_day.wday
    print "   " * indent
    
    
    day = 1
    while day <= last_day.day
        printf "%3d", day
        indent += 1
        if indent % 7 == 0
            print "\n"
        end
        day += 1
    end
    print "\n"
end


options = {}
opt = OptionParser.new

opt.on("-y YEAR", Integer) { |y| options[:year] = y }
opt.on("-m MONTH", Integer) { |m| options[:month] = m }
opt.parse!

year = options[:year] || Date.today.year
month = options[:month] || Date.today.month

display_calendar(year, month)



#今月のカレンダーを表示するプログラム
#-yで年を指定
#-mで月を指定
#デフォルトは今年の今月のカレンダーが表示される
#1970年から2100年までのカレンダーを表示する
#一週間ごとに改行

#指定された年月の1日から月末まで順番に処理する。
#各日付が週の何番目の日かを把握し、適切な位置に表示する。
#週の区切りで改行する。
