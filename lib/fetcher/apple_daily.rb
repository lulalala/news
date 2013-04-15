class Fetcher::AppleDaily < Fetcher
  def self.applicable?(url)
    url.include?('appledaily.com.tw')
  end

  def initialize(url)
    @article = Article.new
    @article.url = url
    @raw = open(url).read
    @doc = Nokogiri::HTML(@raw)
  end

  #url = 'http://www.appledaily.com.tw/appledaily/article/headline/20130414/34951658'
  def fetch
    @article.title = @doc.at_css('#h1').text

    @article.company_name = '蘋果日報'

    @article.content = @doc.css('.articulum').css('p,h2').text

    @article.reporter_name = parse_reporter_name()

    @article.published_at = Time.parse(@doc.css('.gggs time @datetime').text)

    clean_up

    @article
  end

  def parse_reporter_name
    text = @doc.css('.articulum').css('p,h2').text.strip
    if match = text.match(%r{◎記者(.+)$})
      reporter_name = match[1]
    end
    reporter_name
  end
end
