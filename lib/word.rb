require File.expand_path("../word/extract", __FILE__)
require File.expand_path("../word/match", __FILE__)
require File.expand_path("../word/regexp", __FILE__)
require File.expand_path("../word/version", __FILE__)
require File.expand_path("../word/wildcard", __FILE__)

String.send :include, Word::Match
String.send :include, Word::Extract
