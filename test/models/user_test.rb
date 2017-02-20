require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(first_name: 'test', last_name: 'tester', password: '1234',email: 'test1@mail.com',
                     username: 'tested')
  end
  test 'should be valid' do
    assert @user.valid?
  end
end
