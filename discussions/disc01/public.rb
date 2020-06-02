require "minitest/autorun"
require_relative "list.rb"
require_relative "rubyist.rb"

class PublicTests < Minitest::Test
  def setup
    @list = LinkedList.new(3)
    @list.add(7)
    @list.add(-1)

    @obj = RubyIdentifier.new
    @obj.add("Omar", "Y")
    @obj.add("Stephen", "N")
    @obj.add("Timothy", "N")
    @obj.add("Omar", "N")
    @obj.add("Cameron", "Y")
  end

  def test_public_to_s
    assert_equal("[3, 7, -1]", @list.to_s)
  end

  def test_public_add
    assert_equal(["Cameron", "Omar", "Stephen", "Timothy"].sort, @obj.get_everyone.sort)
  end

  def test_public_ruby_haters
    assert_equal(["Stephen", "Timothy"].sort, @obj.ruby_haters.sort)
  end

  def test_public_delete_the_haters
    @obj.delete_the_haters(["Timothy", "Cameron", "Omar"])
    assert_equal(["Cameron", "Omar", "Stephen"], @obj.get_everyone.sort)
  end
end
