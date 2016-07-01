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

  context " when a vote is currently made" do

    it "it destroys the vote when an upvote is cast again" do
      vote_setup(user, post)
      click_on("+1")
      expect { click_on("+1") }.to change{Vote.count}.by(-1)
    end

    it "modifies the value of the existing upvote when a downvote is cast" do
      vote_setup(user, post)
      click_on("+1")
      vote = user.votes.first
      click_on("-1")
      vote = user.votes.first
      expect(vote.value).to eq(-1)
    end

    it "it destroys the vote when a downvote is cast again" do
      vote_setup(user, post)
      click_on("-1")
      expect { click_on("-1") }.to change{Vote.count}.by(-1)
    end

    it "modifies the value of the existing downvote when an upvote is cast" do
      vote_setup(user, post)
      click_on("-1")
      vote = user.votes.first
      click_on("+1")
      vote = user.votes.first
      expect(vote.value).to eq(1)
    end
  end
end
