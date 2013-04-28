class Fetcher::ChinaTimes < Fetcher
  def self.applicable?(url)
    url.include?('chinatimes.com')
  end

  #url = 'http://news.chinatimes.com/mainland/11050505/112013041400325.html'
  def fetch
    @article.title = @doc.at_css('.highlight').text

    @article.company_name = @doc.css('.bar-align-left>ul.inline-list>li')[1].text
    if @article.company_name == '新聞速報'
      @article.company_name = nil
    end

    @article.content = @doc.css('#ctkeywordcontent').text

    #@article.web_published_at = Time.parse(@doc.at_css('#story_update').text)

    @article.reporter_name = parse_reporter_name()
    @article.published_at = Time.parse(@doc.css('.bar-align-left>ul.inline-list>li')[0].text)

    clean_up

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

  def clean_url
    cleaner = UrlCleaner.new('id')
    @article.url = cleaner.clean(@article.url)
  end

  def reproduced?
    @doc.css('div.articlebox ul.inline-list li.ui').text.include?('中央社')
  end
end
