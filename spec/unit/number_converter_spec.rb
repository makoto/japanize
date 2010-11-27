# -*- encoding: utf-8 -*-
require 'minitest/spec'
require 'minitest/autorun'
class NumberConverter
  def self.convert(string)
    converted = ''
    string.each_char do |s|
      converted << "1" if s == "１"
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
end