# -*- encoding: utf-8 -*-

module Japanize
  
  def self.included(base)
    base.send(:include, Grammar)
  end
  
  module Grammar
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
    def 助詞; POSTPOSITIONAL_PARTICLES; end
    def 数字; NUMBERS; end
    def 動詞; VERBS; end
  end
  
  class NumberConversionError < StandardError; end
  class NumberConverter
    extend Grammar
    
    def self.convert(string)
      converted = ''
      string.each_char do |s|
        raise NumberConversionError unless 数字[s]
        converted << 数字[s] 
      end
      if converted.match(/\./)
        converted.to_f
      else
        converted.to_i
      end
    end
  end

  class Parser
    include Grammar
    def initialize(sequence)
      @sequence = sequence
    end
  
    def parse
      @sequence.split('　').map do |s| 
        s.split(/#{助詞.join("|")}/)
      end.flatten.map do |s|
        if 動詞[s]
         動詞[s]
        elsif 数字[s[0]]
         NumberConverter.convert(s)
        end
      end
    end
  end
end