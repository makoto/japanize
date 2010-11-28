# Japanize

Simple library to calculate in Japanese

## Usage

    [japanize (master)]$ rake install japanize
    japanize 0.0.1 built to pkg/japanize-0.0.1.gem
    japanize (0.0.1) installed

    [japanize (master)]$ gem list japanize

    *** LOCAL GEMS ***

    japanize (0.0.1)
    [japanize (master)]$ irb
    ruby-1.9.2-p0 > require 'japanize'
    => true 
    ruby-1.9.2-p0 > １に２をたして４を掛ける
    => 12 

## Prerequisite

-- Ruby 1.9 with readline (for osx)

    # http://d.hatena.ne.jp/rochefort/20100907/p1
    rvm package install readline
    rvm install 1.9.2 -C --with-readline-dir=$HOME/.rvm/usr

-- Enable Japanese on your machine (easy for osx)

- http://redcocoon.org/cab/mysoft.html


## References

- [RubiMaVM](http://jp.rubyist.net/magazine/?0007-YarvManiacs)(Ja) = By Koichi Sasada. Explaining the basic of Ruby 1.9 virtual machine by writing simple VM in Ruby. My evaluator.rb is based on this.
- [Reverse Polish Notation](http://en.wikipedia.org/wiki/Reverse_Polish_notation) = Japanese and rpn are similar.
- [Forth](http://en.wikipedia.org/wiki/Forth_(programming_language)) = RPN based programming language
- [Nadeshiko](http://nadesi.com/) = Japanese programming language. Influenced by Forth and Python
- [Mind](http://www2.airnet.ne.jp/sardine/langs/Mind.html) = Japanese programming language 
