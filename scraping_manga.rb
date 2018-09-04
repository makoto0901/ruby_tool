require 'mechanize'
require 'csv'
require 'benchmark'

agent = Mechanize.new
next_page_url = ""
result = Benchmark.realtime do
  CSV.open("write-sample.csv", "w") do |test|
    test << ["title", "image"]
    while true do
      page = agent.get("http://www.yatate.net/ippolice/#{next_page_url}")
      # 本来はタイトルと画像別々に取得するべきだが、DOM構成的に以下で取れるみたいなので一旦これで
      elements = page.search('.clearfix .image img')
      elements.each do |ele|
        test << [ele.get_attribute('alt'), ele.get_attribute('src')]
      end

      # 次のリンクがあるかチェック
      next_link = page.at('.page-navigation-next a')
      if next_link.nil? then
        puts "処理終了"
        break
      end

      #ページ数を取得
      reg = /\/\?/.match(next_link.get_attribute('href'))
      next_page_url = "?" + reg.post_match
    end
  end
end
puts "合計時間 #{result}s"
