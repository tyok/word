require File.expand_path("../wildcard", __FILE__)
module Word
  module Regexp

    def word_regexp(wildcard = Word::WILDCARD, options = true)
      wildcard = wildcard || Word::WILDCARD
      prefixed = /^(#{wildcard})/
      suffixed = /(#{wildcard})$/

      prefix = (wildcard and self =~ prefixed) ? "" : "\\b"
      suffix = (wildcard and self =~ suffixed) ? "" : "\\b"

      w = self.gsub(/#{prefixed}|#{suffixed}/, "")
      w = prefix + ::Regexp.escape(w) + suffix

      ::Regexp.new(w, options)
    end

    def self.has_any_regexp(words, wildcard = Word::WILDCARD, options = true)
      /#{words.map{|w| w.word_regexp(wildcard, options)}.join('|')}/
    end

  end
end
