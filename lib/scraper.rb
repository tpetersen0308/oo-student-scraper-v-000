require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    Nokogiri::HTML(open(index_url)).css(".student-card").each do |student|
      new_student = {}
      new_student[:name] = student.css(".student-name").text
      new_student[:location] = student.css(".student-location").text
      new_student[:profile_url] = student.css("a").attribute("href").value
      students << new_student
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    profile = {twitter: "", linkedin: "", github: "", blog: "", profile_quote: "", bio: ""}
    doc = Nokogiri::HTML(open(profile_url)).css(".main-wrapper-profile")
    doc.css(".social-icon-container a").attribute("href").value
  end

end
