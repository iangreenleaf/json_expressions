require 'spec_helper'
require 'json_expressions/rspec'

module JsonExpressions
  module RSpec
    describe Matchers, "#include_json_expression" do
      before(:each) do
        @hash = {
          l1_string:   'Hello world!',
          l1_regexp:   '0xC0FFEE',
          l1_object:   {
            l2_string:   'Hi there!',
          }
        }
      end

      it "ignores extra elements" do
        @hash.should include_json_expression(l1_string: 'Hello world!')
      end

      it "still uses matchers" do
        @hash.should include_json_expression(l1_regexp: /\A0x[0-9a-f]+\z/i, l1_object: { l2_string: String })
      end

      it "catches missing elements" do
        @hash.should_not include_json_expression(l1_string: 'Hello world!', element_should_be_here: "uh oh!")
      end

      it "catches nonmatching elements" do
        @hash.should_not include_json_expression(l1_string: 'Wrong string!')
      end

      it "works with JSON strings" do
        positive_json_string = '{"l1_string":"Hello world!","l1_regexp":"0xC0FFEE","l1_object":{"l2_string":"Hi there!"}}'
        negative_json_string = '{"l1_string":"Wrong","l1_regexp":"0xC0FFEE","l1_object":{"l2_string":"Hi there!"}}'

        positive_json_string.should include_json_expression(l1_string: 'Hello world!')
        negative_json_string.should_not include_json_expression(l1_string: 'Hello world!')
      end
    end
  end
end
