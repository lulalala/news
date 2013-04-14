class Fetcher
  attr_reader :doc

  def self.subclasses
    [ Fetcher::Udn, Fetcher::LibertyTimes, Fetcher::ChinaTimes ]
  end

  def self.applicable_fetcher(url)
    fetcher_class = subclasses.find do |fetcher_class|
      fetcher_class.applicable?(url)
    end
    if fetcher_class
      fetcher_class.new(url)
    end
  end
end
