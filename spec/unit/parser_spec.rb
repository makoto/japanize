# -*- encoding: utf-8 -*-
require 'minitest/spec'
require 'minitest/autorun'
require 'japanize'


describe Parser do

  it "must parse addition" do
    Parser.new("１　に　２　を　たす").parse.must_equal [1, 2, :+]
  end

  it "must parse combinations" do
    Parser.new("１　に　２　を　たし　て　４　を　掛ける").parse.must_equal [1, 2, :+, 4, :*]
  end

  it "must parse more double digit numbers" do
    Parser.new("１１　に　２４１　を　たし　て　４.１　を　掛ける").parse.must_equal [11, 241, :+, 4.1, :*]
  end

  it "must divide a phrase into words" do
    Parser.new("１　に　２　を　たし　て　４　を　掛ける").parse.must_equal [1, 2, :+, 4, :*]
  end

end

