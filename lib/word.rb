require File.expand_path("../word/extract", __FILE__)
require File.expand_path("../word/regexp", __FILE__)
require File.expand_path("../word/search", __FILE__)
require File.expand_path("../word/version", __FILE__)
require File.expand_path("../word/wildcard", __FILE__)

String.send :include, Word::Search
String.send :include, Word::Extract
