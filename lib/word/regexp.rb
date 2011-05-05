module Word
  module Regexp
    WILDCARD = /\*/

    def word_regexp(wildcard = WILDCARD, options = nil)
      prefixed = /^(#{wildcard})/
      suffixed = /(#{wildcard})$/

      prefix = (wildcard and self =~ prefixed) ? "" : "\\b"
      suffix = (wildcard and self =~ suffixed) ? "" : "\\b"

      w = self.gsub(/#{prefixed}|#{suffixed}/, "")
      w = prefix + ::Regexp.escape(w) + suffix

      ::Regexp.new(w, options)
    end

    # "a b 'c d'" => ["a", "b", "\"c d\""]
    def extract_words(wildcard = WILDCARD)
      word = /".*?"|'.*?'|#{wildcard}?\w+#{wildcard}?/ # "word1 word2" | 'word1 word2' | word
      scan(word).flatten.map{|x| x.gsub(/"|'/, '"')}.uniq
    end

    private

    def has_any_regexp(words, wildcard = WILDCARD)
      /#{words.map{|w| w.word_regexp(wildcard, true)}.join('|')}/
    end

  end
end
