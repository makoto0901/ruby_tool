["Glay", "Larc" , "LUNASEA"].each do |band|
  self.class.const_set(
    :"#{band}", Class.new do
    def favorite_song
      case self.class.to_s
      when "Glay" then
        puts "rain"
      when "Larc" then
        puts "sell my soul"
      when "LUNASEA" then
        puts "time is dead"
      end
    end
  end
  )
end

glay = Glay.new
glay.favorite_song
larc = Larc.new
larc.favorite_song
lunasea = LUNASEA.new
lunasea.favorite_song
