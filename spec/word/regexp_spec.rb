require "spec_helper"
require "word/regexp"

String.send :include, Word::Regexp

describe Word::Regexp do

  describe "word_regexp" do
    before :each do
      @word = "penguin"
      @normal_matches      = ["penguin", "Ima penguin!", "Me da'penguin"]
      @insensitive_matches = ["PenGuin", "Ima PengUin!", "Me da'PENGUIN"]
      @normal_not_matches  = ["kitten", "dog", "pengu", "guin"]
      @suffixed_matches    = ["real penguinterminator", "penguinhuh, yeah"]
      @prefixed_matches    = ["I'm dapenguin y'know?"]
      @wildcard_matches    = ["oh my supercalifragilisticexpenguindociou OMIGOD!!!"]
    end

    it "returns a valid regexp" do
      @word.word_regexp.must_be_kind_of ::Regexp
    end

    it "returns a regexp to match a word" do
      penguin = @word.word_regexp
      (@normal_matches + @insensitive_matches).each do |string|
        penguin.must_match string
      end
      (@normal_not_matches + @suffixed_matches).each do |string|
        penguin.wont_match string
      end
    end

    it "accepts prefix wildcard" do
      penguin_pref = "*#{@word}".word_regexp nil
      (@normal_matches + @insensitive_matches + @prefixed_matches).each do |string|
        penguin_pref.must_match string
      end
      (@normal_not_matches + @suffixed_matches).each do |string|
        penguin_pref.wont_match string
      end
    end

    it "accepts sufix wildcard" do
      penguin_suf = "#{@word}*".word_regexp nil
      (@normal_matches + @insensitive_matches + @suffixed_matches).each do |string|
        penguin_suf.must_match string
      end
      (@normal_not_matches + @prefixed_matches).each do |string|
        penguin_suf.wont_match string
      end
    end

    it "accepts prefix and sufix wildcard" do
      penguin_wild = "*#{@word}*".word_regexp nil
      (@normal_matches + @insensitive_matches + @suffixed_matches + @prefixed_matches).each do |string|
        penguin_wild.must_match string
      end
      (@normal_not_matches).each do |string|
        penguin_wild.wont_match string
      end
    end

    it "accepts custom wildcard" do
      penguin_wild = "%#{@word}%".word_regexp /%/
      (@normal_matches + @insensitive_matches + @suffixed_matches + @prefixed_matches).each do |string|
        penguin_wild.must_match string
      end
      (@normal_not_matches).each do |string|
        penguin_wild.wont_match string
      end
    end

    it "accepts regexp options" do
      penguin = @word.word_regexp nil, nil
      (@insensitive_matches).each do |string|
        penguin.wont_match string
      end

      penguin_wild = "*#{@word}*".word_regexp nil, ::Regexp::IGNORECASE
      (@normal_matches + @insensitive_matches + @suffixed_matches + @prefixed_matches).each do |string|
        penguin_wild.must_match string
      end
    end
  end

  describe "self.has_any_regexp" do
    before :each do
      @penguin_or_guy = Word::Regexp.has_any_regexp(%w[ penguin guy])
    end

    it "returns a Regexp" do
      @penguin_or_guy.must_be_kind_of ::Regexp
    end

    it "matches any of the words provided" do
      @penguin_or_guy.must_match "a quick brown penguin jumps over lazy polar bear"
      @penguin_or_guy.must_match "a quick brown guy jumps over lazy polar bear"
      @penguin_or_guy.must_match "a quick brown guy jumps over lazy penguin"
      @penguin_or_guy.wont_match "a quick brown fox jumps over lazy dog"
    end
  end

end
