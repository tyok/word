require File.expand_path("../regexp", __FILE__)
module Word
  module Match
    include Regexp

    def has_none?(*args)
      words = args.first.respond_to?(:first) ? args.first : args
      return nil == (self =~ Regexp.has_any_regexp(words))
    end

    def has_any?(*args)
      words = args.first.respond_to?(:first) ? args.first : args
      return nil != (self =~ Regexp.has_any_regexp(words))
    end

    def has_all?(*args)
      words = args.first.respond_to?(:first) ? args.first : args
      matching = match(Regexp.has_any_regexp(words)).to_s.downcase
      return false if matching.empty?
      remain = words - [matching]
      if remain.empty?
        true
      else
        has_all?(remain)
      end
    end

  end
end
