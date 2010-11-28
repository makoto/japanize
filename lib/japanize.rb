# -*- encoding: utf-8 -*-

$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'japanize/parser'
require 'japanize/evaluator'

self.include Japanize

class String
  def japanize
    parsed = Parser.new(self).parse
    Evaluator.new(parsed).evaluate
  end
end


def method_missing (*obj)
  if NUMBERS[obj[0][0]]
    parsed = Parser.new(obj[0].to_s).parse
    Evaluator.new(parsed).evaluate
  else
    super
  end
end