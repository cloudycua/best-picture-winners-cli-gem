class BestPictureWinners::ScraperURL

  def get_url_pages
    all_url_pages = []
    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/9/"))
    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/8/"))
#    @all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/7/"))
#    @all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/6/"))
#    @all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/5/"))
#    @all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/4/"))
#    @all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/3/"))
#    @all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/2/"))
#    @all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/"))
    all_url_pages
  end

  def scrape_movie_titles
    movie_titles = []
    count = get_url_pages.size
    get_url_pages[0].css(".article_movie_title").each do |movie|
      movie_titles << movie.css("h2 a").text
    end
    count
  end

#  def scrape_movie_urls
#    movie_url = get_url_pages[0].css(".article_movie_title a h2").text
#    movie_url

    # h2".attr('href'))
    #movie_url
#  end

#  def make_movies
#    get
#  end


end
