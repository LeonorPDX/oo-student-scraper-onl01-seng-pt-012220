require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = []
    
    doc.css(".student-card").each do |student|
      data = {
        :name => student.css("h4").text,
        :location => student.css(".student-location").text,
        :profile_url => student.css("a").attribute("href").value
      }
      
      students << data
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    
    binding.pry
    
#    {
#      :twitter => doc.css(),
#      :linkedin => doc.css(),
#      :github => doc.css(),
#      :blog => doc.css(),
#      :profile_quote => doc.css(),
#      :bio => doc.css()
#    }
    
  end

end

Scraper.scrape_profile_page("https://learn-co-curriculum.github.io/student-scraper-test-page/students/ryan-johnson.html")

