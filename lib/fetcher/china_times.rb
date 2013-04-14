class Fetcher::ChinaTimes < Fetcher
  def initialize(url)
    @article = Article.new
    @article.url = url
    @raw = open(url).read.encode('utf-8', 'big5', :invalid => :replace, :undef => :replace, :replace => '')
    @doc = Nokogiri::HTML(@raw)
  end

  def self.applicable?(url)
    url.include?('chinatimes.com')
  end

  #url = 'http://news.chinatimes.com/mainland/11050505/112013041400325.html'
  def fetch
    @article.title = @doc.at_css('.highlight').text
    @article.company_name = @doc.css('.bar-align-left>ul.inline-list>li')[1].text
    @article.content = @doc.css('#ctkeywordcontent').text

    #@article.web_published_at = Time.parse(@doc.at_css('#story_update').text)

    @article.reporter_name = parse_reporter_name()
    @article.published_at = Time.parse(@doc.css('.bar-align-left>ul.inline-list>li')[0].text)

    @article
  end

  def parse_reporter_name
    text = @doc.css('.bar-align-left>ul.inline-list>li.last').text
    if match = text.match(%r{記者(.+?)[/／╱／]})
      reporter_name = match[1]
    elsif match = text.match(%r{【(.+?)[/／╱／]})
      reporter_name = match[1]
    end
    reporter_name
  end
end
