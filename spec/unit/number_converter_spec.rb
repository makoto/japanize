# -*- encoding: utf-8 -*-
require 'minitest/spec'
require 'minitest/autorun'
require 'japanize'

describe NumberConverter do
  
  it "must convert single value" do
    NumberConverter.convert("１").must_equal 1
  end
  
  it "must convert double digits" do
    NumberConverter.convert("１１").must_equal 11
  end

  it "must convert tripble digits" do
    NumberConverter.convert("２４１").must_equal 241
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