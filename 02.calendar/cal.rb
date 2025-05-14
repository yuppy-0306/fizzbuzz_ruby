#!/usr/bin/env ruby
require 'date'
require 'optparse'

def display_calendar(year,month)
    first_day = Date.new(year, month, 1)
    #first_dayはy年m月1日が入る
    last_day = Date.new(year,month,-1)
    #last_dayはy年m月の最終日が入る
    puts "#{year}年#{month}月"
    puts "日 月 火 水 木 金 土"
    indent = first_day.wday
    print "    " * indent
    #曜日分だけ空白を入れる

end
#今月のカレンダーを表示するプログラム
#-yで年を指定
#-mで月を指定
#デフォルトは今年の今月のカレンダーが表示される
#1970年から2100年までのカレンダーを表示する
#一週間ごとに改行

#指定された年月の1日から月末まで順番に処理する。
#各日付が週の何番目の日かを把握し、適切な位置に表示する。
#週の区切りで改行する。