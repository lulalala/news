class Fetcher::Udn < Fetcher
  def initialize(url)
    @url = url
    @raw = open(url).read.encode('utf-8', 'big5', :invalid => :replace, :undef => :replace, :replace => '')
    @doc = Nokogiri::HTML(@raw)
  end

  def self.applicable?(url)
    url.include?('udn.com')
  end

  #url = 'http://udn.com/NEWS/NATIONAL/NATS5/7807573.shtml'
  def fetch
    a = Article.new(url:@url)
    a.title = @doc.at_css('#story_title').text
    a.content = @doc.at_css('#story').text

    #a.web_published_at = Time.parse(@doc.at_css('#story_update').text)

    origin = @doc.at_css('#story_author').text.match(%r{【(.*)[/／╱](.*)[/／╱]})
    a.company_name = origin[1]
    a.reporter_name = origin[2][%r{記者(.+)},1]
    a.published_at = Time.parse(@doc.at_css('#story_update').text)

    a
  end
end
