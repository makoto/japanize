# -*- encoding: utf-8 -*-
require 'minitest/spec'
require 'minitest/autorun'

class Evaluator
  def initialize(array)
    @object, @target, @operand = array
  end
  
  def evaluate
    @object.send(@operand, @target)
  end
end

describe Evaluator do

  it "must calculate single operation" do
    Evaluator.new([1, 2, :+]).evaluate.must_equal 3
  end
  
end