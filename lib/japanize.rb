# -*- encoding: utf-8 -*-

$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'japanize/parser'
require 'japanize/evaluator'

module Japanize
  # Your code goes here...
  def this_is_japanization_method
    true
  end
  
end
self.include Japanize

class String
  def japanize
    parsed = Parser.new(self).parse
    Evaluator.new(parsed).evaluate
  end
end


def method_missing (*obj)
  if Japanize::NUMBERS[obj[0][0]]
    parsed = Parser.new(obj[0].to_s).parse
    Evaluator.new(parsed).evaluate
  else
    super
  end
end