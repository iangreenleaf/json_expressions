require 'minitest/unit'
require 'minitest/spec'
require 'json_expressions'
require 'json_expressions/minitest/assertions'

# module MiniTest::Assertions
#   include JsonExpressions::MiniTest::Assertions
# end

class MiniTest::Unit::TestCase
  WILDCARD_MATCHER = JsonExpressions::WILDCARD_MATCHER

  def wildcard_matcher
    ::JsonExpressions::WILDCARD_MATCHER
  end
end

Object.infect_an_assertion :assert_json_match, :must_match_json_expression
Object.infect_an_assertion :refute_json_match, :wont_match_json_expression
Object.infect_an_assertion :assert_json_include, :must_include_json_expression
Object.infect_an_assertion :refute_json_include, :wont_include_json_expression
