require "spec_helper"
require "word/extract"

String.send :include, Word::Extract

describe Word::Extract do

  describe "extract_words" do
    it "returns an array" do
      "penguin guy".extract_words.must_be_kind_of Array
    end

    it "extracts words from a string" do
      "penguin guy".extract_words.must_equal %w[ penguin guy ]
      "PenguIn guy".extract_words.must_equal %w[ PenguIn guy ]
    end

    it "treats a pair of quote and anything between as a word" do
      "'awesome penguin' guy".extract_words.must_equal %w[ "awesome\ penguin" guy ]
    end
  end

end
