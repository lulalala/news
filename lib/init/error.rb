module NewsSucks
  class ParserNotExistError < StandardError; end
  class ParseError < StandardError; end
  module Parse
    class CitedError < ParseError; end
  end
end
