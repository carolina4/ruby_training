class Song
	def initialize(lyrics)
		@lyrics = lyrics
	end

	def sing_me_a_song()
		@lyrics.each {|line| puts line}
	end
end

happy_bday = Song.new([
	"Happy birthday to you",
	"Happy birthday to you",
	"Happy birthday dear Caro",
	"Happy birthday to you"
])

happy_bday.sing_me_a_song()