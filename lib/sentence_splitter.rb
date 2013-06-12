class SentenceSplitter
  # returns an array of sentences
  def self.split(text)
    regular_exp = /(?:    # Either match...
                    「.*」  # a quoted sentence
                  |         # or
                    [^「」『』。？！]*   # anything except quotes or dots.
                  )+        # Repeat as needed
                  [。？！]\s*     # Then match a dot and optionally some whitespace.
                  /x
    sentences = text.scan(regular_exp)
    sentences.each do |cl| cl.gsub!(/[[:space:]]/, ' ') end
    sentences.each(&:strip!)
  end
end
