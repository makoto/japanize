require 'minitest/spec'
require 'minitest/autorun'

require 'japanize'

describe "Japanization" do
  it "must call japanization method" do
    self.this_is_japanization_method.must_equal true
  end
end