require File.expand_path("../wildcard", __FILE__)
module Word
  module Extract
    # "a b 'c d'" => ["a", "b", "\"c d\""]
    def extract_words(wildcard = Word::WILDCARD)
      word = /".*?"|'.*?'|#{wildcard}?\w+#{wildcard}?/ # "word1 word2" | 'word1 word2' | word
      scan(word).flatten.map{|x| x.gsub(/"|'/, '"')}.uniq
    end
  end
end
