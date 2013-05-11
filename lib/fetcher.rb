class Fetcher
  attr_reader :doc

  def self.applicable?(url)
    url.include?(domain())
  end

  def self.subclasses
    [ Fetcher::Udn, Fetcher::LibertyTimes, Fetcher::ChinaTimes, Fetcher::Cna, Fetcher::AppleDaily ]
  end

  def self.applicable_fetcher(url)
    fetcher_class = subclasses.find do |fetcher_class|
      fetcher_class.applicable?(url)
    end
    if fetcher_class
      fetcher_class.new(url)
    end
  end

  def initialize(url)
    @article = Article.new
    @article.url = url
    @article.url_id = parse_url_id()
    @article.web_domain = self.class.domain()
    @raw = open(url).read.encode('utf-8', 'big5', :invalid => :replace, :undef => :replace, :replace => '')
    @doc = Nokogiri::HTML(@raw)
  end

  def clean_up
    @article.content.try :strip!
    @article.title.try :strip!
    @article.reporter_name.try :strip!
    @article.company_name.try :strip!
    clean_url if respond_to?(:clean_url)
    @article.reproduced = reproduced?
  end

  def reproduced?
    false
  end
end
