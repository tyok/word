require "spec_helper"
require "word/match"

String.send :include, Word::Match

describe Word::Match do

  describe "has_none?" do
    it "returns true if none of its arguments is in the string" do
      "penguin guy".has_none?( "bear" ).must_equal true
      "penguin guy".has_none?(["bear"]).must_equal true
    end

    it "returns false if any of its arguments is in the string" do
      "penguin guy".has_none?( "bear", "guy" ).must_equal false
      "penguin guy".has_none?(["bear", "guy"]).must_equal false
    end

    it "returns false if all of its arguments is in the string" do
      "penguin guy".has_none?( "penguin", "guy" ).must_equal false
      "penguin guy".has_none?(["penguin", "guy"]).must_equal false
    end
  end

  describe "has_any?" do
    it "returns false if none of its arguments is in the string" do
      "penguin guy".has_any?( "bug", "bear" ).must_equal false
      "penguin guy".has_any?(["bug", "bear"]).must_equal false
    end

    it "returns true if any of its arguments is in the string" do
      "penguin guy".has_any?( "penguin", "lover" ).must_equal true
      "penguin guy".has_any?(["penguin", "lover"]).must_equal true
    end

    it "returns true if all of its arguments is in the string" do
      "penguin guy".has_any?( "penguin", "guy" ).must_equal true
      "penguin guy".has_any?(["penguin", "guy"]).must_equal true
    end
  end

  describe "has_all?" do
    it "returns false if none of its arguments is in the string" do
      "penguin guy".has_all?( "bug", "bear" ).must_equal false
      "penguin guy".has_all?(["bug", "bear"]).must_equal false
    end

    it "returns false if any of its arguments is in the string" do
      "penguin guy".has_all?( "penguin", "lover" ).must_equal false
      "penguin guy".has_all?(["penguin", "lover"]).must_equal false
    end

    it "returns true if all of its arguments is in the string" do
      "penguin guy".has_all?( "penguin", "guy" ).must_equal true
      "penguin guy".has_all?(["penguin", "guy"]).must_equal true
    end
  end

end


