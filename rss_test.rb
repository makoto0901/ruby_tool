
require 'rss'


url = 'http://www.nicovideo.jp/ranking/fav/hourly/all?rss=2.0&lang=ja-jp'

rss = RSS::Parser.parse(url)
File.open("sample1.html", "w") do |f|
  f.puts <<-EOS
    <table border='1'>
      <tr>
        <th>ランキング</th>
        <th>タイトル</th>
      </tr>
  EOS
  rss.channel.items.each do|x|
    rank, title = x.title.split("：")
    f.puts <<-EOS
      <tr>
        <td>#{rank}</td>
        <td><a href="#{x.link}">#{title}</a></td>
      </tr>
    EOS
  end
  f.puts "</table>"
end
