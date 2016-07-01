require 'spec_helper'

describe "Voting" do

  let!(:user) { build :user }
  let!(:post) { build :post }

  context "when no votes currently made" do

    it "creates an upvote when a user clicks the up vote button" do
      vote_setup(user, post)
      expect { click_on("+1") }.to change{Vote.count}.by(1)
    end

    it "creates a downvote when a user clicks the down vote button" do
      vote_setup(user, post)
      expect { click_on("-1") }.to change{Vote.count}.by(1)
    end

  end
end
