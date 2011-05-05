require "spec_helper"
require "word/regexp"

String.send :include, Word::Regexp

describe String do
  describe "word_regexp" do
    it "returns a valid regexp" do
      "penguin".word_regexp.must_be_kind_of ::Regexp
    end
  end
end
