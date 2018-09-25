require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do 
    @user = User.new(email: 'Bob')
  end

  test 'should have email and role' do 
    assert_equal false, @user.valid?
  end
  
end
