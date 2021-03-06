require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object
    assert_equal true, 1.is_a?(Object)
    assert_equal true, 1.5.is_a?(Object)
    assert_equal true, "string".is_a?(Object)
    assert_equal true, nil.is_a?(Object)
    assert_equal true, Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    assert_equal "123", 123.to_s
    assert_equal "", nil.to_s
  end

  def test_objects_can_be_inspected
    assert_equal "123", 123.inspect
    assert_equal "nil", nil.inspect
  end

  def test_every_object_has_an_id
    obj = Object.new
    assert_equal Fixnum, obj.object_id.class

    #bash-3.1$ irb
    #irb(main):001:0> Object.new
    #=> #<Object:0x20d4dd0>
    #irb(main):002:0> Object.new.object_id
    #=> 16997988
    #irb(main):003:0> Object.new.object_id.class
    #=> Fixnum
  end

  def test_every_object_has_different_id
    assert_not_equal Object.new.object_id, Object.new.object_id
  end

  def test_small_integers_have_fixed_ids
    assert_equal 1, 0.object_id
    assert_equal 3, 1.object_id
    assert_equal 5, 2.object_id
    assert_equal 201, 100.object_id

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?

    # Answer: it seems to be f(n) = 2*n + 1

    # This does not seem to hold for Float
    #irb(main):001:0> 1.5.object_id
    #=> 18000324
    #irb(main):002:0> 1.5.object_id
    #=> 17780496
    #irb(main):003:0> 1.5.object_id
    #=> 17032776
    #irb(main):004:0> 1.5.object_id

    #but the classes are always the same:
    #irb(main):007:0> 1.5.class.object_id
    #=> 11377956
    #irb(main):008:0> 1.5.class.object_id
    #=> 11377956
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert_not_equal obj, copy
    assert_not_equal obj.object_id, copy.object_id
  end
end
