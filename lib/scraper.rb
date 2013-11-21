#require the libraries that we need
require 'open-uri' #open the file on the internet
require 'nokogiri' #line 10

class Scraper
	attr_reader :html

	def initialize(url)
		download = open(url)
		@html = Nokogiri::HTML(download)
	end

	def get_students_names
		all_the_h3s = html.search("h3")
		all_the_h3s.text
	end

	def get_students_twitter
		array = []
		all_first_children = html.search(".social li a").text.split(" ").each do |x|
		if x[0] == "@"
			array << x
		end
	end 
	array 


end


	 def get_students_blogs
	 end



end

my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
puts my_scraper.get_students_twitter
puts my_scraper.get_students_names

