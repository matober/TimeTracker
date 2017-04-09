require 'test_helper'
require 'bcrypt'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(first_name: 'test', last_name: 'tester', password: BCrypt::Password.create("my password") ,
                     email: 'test1@mail.com', password_confirmation: 'my password')

    @user1 = User.new(last_name: 'tester', password: BCrypt::Password.create("my password") ,
                     email: 'test1@mail.com', password_confirmation: 'my password')

    @user2 = User.new(first_name: 'test', last_name: 'tester', password: BCrypt::Password.create("my password") ,
                     email: 'test1@mail.com', password_confirmation: 'my pass')

    @user3 = User.new(first_name: 'test', last_name: 'tester', password: BCrypt::Password.create("my password") ,
                     password_confirmation: 'my password')
  end
  test 'should be valid' do
    assert @user.valid?
    assert_not @user1.valid?
    assert_not @user2.valid?
    assert_not @user3.valid?

  end
end
