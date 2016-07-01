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

  context "when an upvote is currently made" do

    it "it destroys the vote when an upvote is cast again" do
    end

    it "modifies the value of the existing vote when a downvote is cast" do
    end

  end

  context "when a downvote is currently made" do

    it "it destroys the vote when a downvote is cast again" do
    end

    it "modifies the value of the existing vote when an upvote is cast" do
    end

  end

  end
end
