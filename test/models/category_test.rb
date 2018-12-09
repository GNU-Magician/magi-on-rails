require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "category_valid" do
    assert @category.valid?
  end

  test "name_should_be_valid" do
    @category.name = ""
    assert_not @category.valid?
  end

  test "name_should_be_unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end


  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "a"
    assert_not @category.valid?
  end

end