# -*- encoding: utf-8 -*-
require 'minitest/spec'
require 'minitest/autorun'
class NumberConversionError < StandardError; end
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
    "０" =>"0",
    "." => "."
  }

  def self.convert(string)
    converted = ''
    string.each_char do |s|
      raise NumberConversionError unless NUMBERS[s]
      converted << NUMBERS[s] 
    end
    if converted.scan(/./)
      converted.to_f
    else
      converted.to_i
    end
  end
end

describe NumberConverter do
  
  it "must convert single value" do
    NumberConverter.convert("１").must_equal 1
  end
  
  it "must convert multiple value" do
    NumberConverter.convert("１１").must_equal 11
  end
  
  it "must convert other value" do
    NumberConverter.convert("２").must_equal 2
  end
  
  it "must convert period" do
    NumberConverter.convert("２.２").must_equal 2.2
  end

  it "must raise error when non numbers are mixed" do
    lambda{NumberConverter.convert("１と２")}.must_raise NumberConversionError
  end
  
end