class BestPictureWinners::Scraper

  def get_rotten_tomatoes_pages
  # https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/
  # https://blog.roku.com/best-picture-oscar-winners-ranked-rotten-tomatoes
    doc9 = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/9/"))
    doc8 = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/8/"))
    doc7 = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/7/"))
    doc6 = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/6/"))
    doc5 = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/5/"))
    doc4 = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/4/"))
    doc3 = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/3/"))
    doc2 = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/2/"))
    doc1 = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/"))
  end

  def get_page_imdb
  # https://m.imdb.com/chart/bestpicture/?ref_=m_nv_ch_osc
  end

  def make_movies

  end

end
