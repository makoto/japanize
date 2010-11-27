# -*- encoding: utf-8 -*-
require 'minitest/spec'
require 'minitest/autorun'

# Based on RubiMaVM
# http://jp.rubyist.net/magazine/?0007-YarvManiacs
class Evaluator
  def initialize(sequence)
    p "sequence is #{sequence}"
    @sequence = sequence
    @stack = []
    @pc    = 0
  end

  def evaluate
    while insn = @sequence[@pc]
      p "dispatching insn #{insn}"
      dispatch insn
    end
    @stack[0]
  end

  def dispatch insn
    case insn
    when :add
      push shift + shift
    when :sub
      push shift - shift
    when :mul
      push shift * shift
    when :div
      push shift / shift
    else
      push insn
    end
    p @stack
    @pc += 1
  end

  def push obj
    @stack.push obj
  end

  def pop
    @stack.pop
  end
  
  def shift
    @stack.shift
  end
end

describe Evaluator do

  it "must calculate single operation" do
    Evaluator.new([1, 2, :add]).evaluate.must_equal 3
  end

  it "must calculate multiple operations" do
    Evaluator.new([1, 2, :add, 3 , :mul]).evaluate.must_equal 9
  end

  it "must calculate div operations" do
    Evaluator.new([6, 2, :div]).evaluate.must_equal 3
  end

  it "must calculate sub operations" do
    Evaluator.new([6, 2, :sub]).evaluate.must_equal 4
  end

  it "must calculate float " do
    Evaluator.new([1.5, 2, :add]).evaluate.must_equal 3.5
  end

  it "must calculate all operands" do
    Evaluator.new([1, 2, :add, 3 , :mul , 1, :sub, 2, :div]).
      evaluate.must_equal ((((1+2) * 3) - 1 ) / 2)
  end
end

