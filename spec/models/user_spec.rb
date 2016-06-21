require 'spec_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    expect(create :user).to be_valid 
  end 

  it { is_expected.to validate_presence_of(:email) }



  it "is invalid without a name"
  it "is invalid without an email"

end 

=begin 

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "userexample", password_confirmation: "userexample")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "        "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "       "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "should accept valid email addresses" do
    valid_addresses = %w[viget@rox.com VIGET@rox.COM vi-GET@rox.always.now
                         viget.rox@hello.pbj i+you@we.org]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "should reject invalid addresses" do
    invalid_addresses = %w[viget@rox,com viget_at_stuff.com viget.things@more.
                           vig@et_shrooms.com viget@vig+et.stuff]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = "     "
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
=end 

#end
