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


