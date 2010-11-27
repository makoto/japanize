# -*- encoding: utf-8 -*-
require 'minitest/spec'
require 'minitest/autorun'

class Parser
  VERBS = {
    'たす' => :+, 
    'たして' => :+, 
    '掛ける' => :*  
  }
  NUMBERS = {
    "１" =>"1",
    "２" =>"2",
    "３" =>"3",
    "４" =>"4",
    "５" =>"5",
    "６" =>"6",
    "７" =>"7",
    "８" =>"8",
    "９" =>"9",
    "０" =>"0",
    "." => "."
  }
  
  def initialize(sequence)
    @sequence = sequence
  end
  
  def parse
    results = []
    @sequence.split('　').each do |s|
      if VERBS[s]
       results << VERBS[s]
      elsif NUMBERS[s]
       results << NUMBERS[s].to_i
      else
      end
    end
    results
  end
end

describe Parser do

  it "must parse addition" do
    Parser.new("１　に　２　を　たす").parse.must_equal [1, 2, :+]
  end

  it "must parse combinations" do
    Parser.new("１　に　２　を　たして　４　を　掛ける").parse.must_equal [1, 2, :+, 4, :*]
  end

end

