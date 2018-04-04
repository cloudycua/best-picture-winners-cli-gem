class BestPictureWinners::ScraperURL

  def get_url_pages
    all_url_pages = []
    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/9/"))
#    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/8/"))
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
    pages = get_url_pages.size
    index = 0
    while index < pages do
      get_url_pages[index].css(".article_movie_title").each do |movie|
        movie_titles << movie.css("h2 a").text
      end
      index += 1
    end
    movie_titles
  end

  def scrape_movie_urls
    movie_urls = []
    pages = get_url_pages.size
    index = 0
    while index < pages do
      get_url_pages[index].css(".article_movie_title").each do |movie|
        movie_urls << movie.css.("h2 a").attr("href").value
      end
      index += 1
    end
    movie_urls
  end


#  def make_movies
#    get
#  end


end
