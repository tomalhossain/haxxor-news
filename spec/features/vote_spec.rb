require 'spec_helper'

describe "Voting" do

  let!(:post) { create :post }
  let!(:user) { create :user }

  context "when no votes currently made" do
    it "creates an upvote when a user clicks the up vote button" do
      login(user)
      visit(root_url)
      expect{click_on("+1")}.to change{Vote.count}.by(1)
    end
  end
end
