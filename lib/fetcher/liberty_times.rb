class Fetcher::LibertyTimes < Fetcher
  def initialize(url)
    @url = url
    @raw = open(url).read.encode('utf-8', 'big5', :invalid => :replace, :undef => :replace, :replace => '')
    @doc = Nokogiri::HTML(@raw)
  end

  def self.applicable?(url)
    url.include?('libertytimes.com.tw')
  end

  #url = 'http://www.libertytimes.com.tw/2013/new/apr/13/today-sp2.htm'
  def fetch
    a = Article.new(url:@url)
    a.title = @doc.at_css('#newtitle').text
    a.company_name = '自由時報'
    a.content = @doc.at_css('#newsContent span:not(#newtitle)').text

    #a.web_published_at = Time.parse(@doc.at_css('#story_update').text)

    origin = a.content.match(%r{〔(.*)[/／╱](.*)〕})
    a.reporter_name = origin[1][%r{記者(.+)},1]
    a.published_at = Time.parse(@doc.at_css('#date').text)

    a
  end
end
