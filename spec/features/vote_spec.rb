require 'spec_helper'

describe "Voting" do

  let!(:user) { build :user }
  let!(:post) { build :post }

  before(:each) do
    built_post = user.posts.build({ title: post.title, url: post.url })
    built_post.save
    login(user)
    visit(root_url)
  end

  context "when no votes currently made" do

    it "creates an upvote when a user clicks the up vote button" do
      expect { first('.vote-button').click_on("+1") }.to change{Vote.count}.by(1)
    end

    it "creates a downvote when a user clicks the down vote button" do
      expect { first('.vote-button').click_on("-1") }.to change{Vote.count}.by(1)
    end
  end

  context " when a vote is currently made" do

    it "it destroys the vote when an upvote is cast again" do
      first('.vote-button').click_on("+1")
      expect { first('.vote-button').click_on("+1") }.to change{Vote.count}.by(-1)
    end

    it "modifies the value of the existing upvote when a downvote is cast" do
      first('.vote-button').click_on("+1")
      vote = user.votes.first
      expect { first('.vote-button').click_on("-1") }.to change{vote.reload.value}.by(-2)
    end

    it "it destroys the vote when a downvote is cast again" do
      first('.vote-button').click_on("-1")
      expect { first('.vote-button').click_on("-1") }.to change{Vote.count}.by(-1)
    end

    it "modifies the value of the existing downvote when an upvote is cast" do
      first('.vote-button').click_on("-1")
      vote = user.votes.first
      expect { first('.vote-button').click_on("+1") }.to change{vote.reload.value}.by(2)
    end
  end
end
