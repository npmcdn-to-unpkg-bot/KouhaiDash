require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(
    	username: "Jiayee", 
    	password: "password", 
    	email: "l-jiayee@comp.nus.edu.sg"
  	)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "username should not be too short" do
    @user.username = "z" * 3
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = "z" * 17
    assert_not @user.valid?
  end

  test "password should not be too short" do
    @user.password = "z" * 7
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "z" * 60 + "@gmail.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[
    	user@example.com 
    	USER@foo.COM 
    	A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn
    ]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "usernames and email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
