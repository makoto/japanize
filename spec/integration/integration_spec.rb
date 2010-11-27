# -*- encoding: utf-8 -*-
require 'minitest/spec'
require 'minitest/autorun'

require 'japanize'

describe "Japanization" do
  it "must call japanization method" do
    self.this_is_japanization_method.must_equal true
  end

  describe String do
    it "must calculate single math operation" do
      "１　に　２　を　たす".japanize.must_equal 3
    end
  end
  
  it "must calculate single math operation" do
    skip("Not started yet")
     (１　に　２　を　たす).must_equal 3
  end
  
  it "must calculate compound math operation" do
    skip("Not started yet")
    (１　に　２　を　たして　３　を　かける).must_equal 9
  end
end