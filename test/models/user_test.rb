require 'test_helper'
require 'authlogic/test_case'
require 'bcrypt'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
        first_name: 'ben',
        last_name: 'rocks',
        email: 'whatever@whatever.com',
        password: 'benrocks',
        password_confirmation: 'benrocks',
        persistence_token: Authlogic::Random.hex_token)
  end
  test 'should be valid' do
    assert @user.valid?
  end
end
