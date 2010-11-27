# Based on RubiMaVM
# http://jp.rubyist.net/magazine/?0007-YarvManiacs
module Japanize
  class Evaluator
    def initialize(sequence)
      # p "sequence is #{sequence}"
      @sequence = sequence
      @stack = []
    end

    def evaluate
      @sequence.each do |insn|
        dispatch insn
      end
      @stack.first
    end

    def dispatch insn
      if [:+, :-, :*, :/].include?(insn)
        push (shift).send(insn, shift)
      else
        push insn
      end
      # p @stack
    end

    def push obj
      @stack.push obj
    end

    def shift
      @stack.shift
    end
  end
end