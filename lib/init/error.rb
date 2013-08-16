module NewsSucks
  class ParseError < StandardError; end
  module Parse
    class CitedError < ParseError; end
  end
end
