module Word
  module Match
    include Regexp

    def has_none?(*args)
      words = args.first.respond_to?(:first) ? args.first : args
      return true if words.empty?
      return nil == (self =~ Regexp.has_any_regexp(words))
    end

    def has_any?(*args)
      words = args.first.respond_to?(:first) ? args.first : args
      return true if words.empty?
      return nil != (self =~ Regexp.has_any_regexp(words))
    end

    def has_all?(*args)
      words = args.first.respond_to?(:first) ? args.first : args
      return true if words.empty?
      matching = match(Regexp.has_any_regexp(words)).to_s.downcase
      return false if matching.empty?
      has_all?(words - [matching])
    end

  end
end
