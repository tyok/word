module Word
  module Search
    include Regexp

    def has_none?(words)
      return true if words.empty?
      return nil == (self =~ has_any_regexp(words))
    end

    def has_any?(words)
      return true if words.empty?
      return nil != (self =~ has_any_regexp(words))
    end

    def has_all?(words)
      return true if words.empty?
      matching = match(has_any_regexp(words)).to_s.downcase
      return false if matching.empty?
      has_all?(words - [matching])
    end

  end
end
