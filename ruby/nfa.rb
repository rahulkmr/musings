#!/usr/bin/env ruby
require 'set'
require 'test/unit'

def match(str, start, finish, trans)
  state = [start]
  str.each_char do |c|
    # Obtain next states.
    state = state.map {|s| trans[s][c] if trans[s] and trans[s][c] }.flatten
    break if state.nil?
  end or return false
  state.each {|s| return true if finish.include? s } and return false
end


class TestFSM < Test::Unit::TestCase
  def test_dfa
    # (a+b)|(c+d)
    trans = {0 => {'a' => 1, 'c' => 3},
      1 => {'a' => 1, 'b' => 2},
      3 => {'c' => 3, 'd' => 4}}
    finish = Set[2, 4]

    assert_equal(match('cda', 0, finish, trans), false)
    assert_equal(match('ccd', 0, finish, trans), true)
    assert_equal(match('ccccccccccccd', 0, finish, trans), true)
    assert_equal(match('abc', 0, finish, trans), false)
    assert_equal(match('ab', 0, finish, trans), true)
    assert_equal(match('aaaab', 0, finish, trans), true)
  end

  def test_nfa
    # (ab*c)|(ac*d)
    trans = {0 => {'a' => [1, 3]},
      1 => {'b' => 1, 'c' => 2},
      3 => {'c' => 3, 'd' => 4}}
    finish = Set[2, 4]

    assert_equal(match('aaabd', 0, finish, trans), false)
    assert_equal(match('abbbc', 0, finish, trans), true)
    assert_equal(match('acccd', 0, finish, trans), true)
    assert_equal(match('aaccd', 0, finish, trans), false)
  end
end
