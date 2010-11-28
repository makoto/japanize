# -*- encoding: utf-8 -*-

module Japanize
  VERBS = {
    'たす' => :+,  # tasu
    'たし' => :+,  # tashi
    'ひく' => :-,  # hiku
    'ひい' => :-,  # hii
    'かける' => :*, # kakeru
    'かけ' => :*,  # kake
    'わる' => :/,  # waru
    'わっ' => :/,  # wa
    '足す' => :+,  # tasu
    '足し' => :+,  # tashi
    '引く' => :-,  # hiku
    '引い' => :-,  # hii
    '掛ける' => :*, # kakeru
    '掛け' => :*,  # kake
    '割る' => :/,  # waru
    '割っ' => :/   # wa
  }
  
  POSTPOSITIONAL_PARTICLES = ['て','に','を','は']

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
      @sequence.split('　').map do |s| 
        s.split(/#{POSTPOSITIONAL_PARTICLES.join("|")}/)
      end.flatten.map do |s|
        if VERBS[s]
         VERBS[s]
        elsif NUMBERS[s[0]]
         NumberConverter.convert(s)
        end
      end
    end
  end
end