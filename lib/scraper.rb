require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = []
    
    doc.css(".student-card").each do |student|
#      binding.pry
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
    
  end

end

#Scraper.scrape_index_page("https://learn-co-curriculum.github.io/student-scraper-test-page/")

