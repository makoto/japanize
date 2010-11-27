# -*- encoding: utf-8 -*-

module Japanize
  VERBS = {
    'たす' => :+, 
    'たして' => :+, 
    'ひく' => :-, 
    'ひいて' => :-, 
    'かける' => :*, 
    'かけて' => :*, 
    'わる' => :/, 
    'わって' => :/, 
    'タス' => :+, 
    'タシテ' => :+, 
    'ヒク' => :-, 
    'ヒイテ' => :-, 
    'カケル' => :*, 
    'カケテ' => :*, 
    'ワル' => :/, 
    'ワッテ' => :/, 
    '足す' => :+, 
    '足して' => :+, 
    '引く' => :-, 
    '引いて' => :-, 
    '掛ける' => :*, 
    '掛けて' => :*, 
    '割る' => :/, 
    '割って' => :/
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
  class NumberConversionError < StandardError; end
  class NumberConverter
    def self.convert(string)
      converted = ''
      string.each_char do |s|
        raise NumberConversionError unless NUMBERS[s]
        converted << NUMBERS[s] 
      end
      if converted.match(/\./)
        converted.to_f
      else
        converted.to_i
      end
    end
  end

  class Parser
    def initialize(sequence)
      @sequence = sequence
    end
  
    def parse
      results = []
      @sequence.split('　').each do |s|
        if VERBS[s]
         results << VERBS[s]
        elsif NUMBERS[s[0]]
         results << NumberConverter.convert(s)
        else
        end
      end
      results
    end
  end
end