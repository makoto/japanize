# -*- encoding: utf-8 -*-
require 'minitest/spec'
require 'minitest/autorun'
class NumberConverter

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
    "０" =>"0"
  }

  def self.convert(string)
    converted = ''
    string.each_char do |s|
      converted << NUMBERS[s] 
    end
    converted.to_i
  end
end

describe "Japanization" do
  
  it "must convert single value" do
    NumberConverter.convert("１").must_equal 1
  end
  
  it "must convert multiple value" do
    NumberConverter.convert("１１").must_equal 11
  end
  
  it "must convert other value" do
    NumberConverter.convert("２").must_equal 2
  end
  
end