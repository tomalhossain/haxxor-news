require "spec_helper"

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(create :user).to be_valid
  end

  describe "Name" do
    it { is_expected.to validate_length_of(:name)}
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "Email" do

    valid_addresses = %w[viget@rox.com VIGET@rox.COM vi-GET@rox.always.now
                         viget.rox@hello.pbj i+you@we.org]
    invalid_addresses = %w[viget@rox,com viget_at_stuff.com viget.things@more.
                           vig@et_shrooms.com viget@vig+et.stuff]

    it { is_expected.to validate_length_of(:email) }
    it { is_expected.to validate_presence_of(:email) }

    valid_addresses.each do |valid_address|
      it { is_expected.to allow_value(valid_address).for(:email) }
    end

    invalid_addresses.each do |invalid_address|
      it { is_expected.not_to allow_value(invalid_address).for(:email) }
    end
  end

  describe "Password" do
    it {is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password)}
    it { is_expected.to validate_presence_of(:password) }
  end

  describe "#authenticated" do

  end


end

