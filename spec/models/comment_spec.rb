require 'spec_helper'

describe Comment, type: :model do

  let!(:user)               { build :user }
  let!(:post)               { build :post }
  let!(:comment_for_post)   { build :comment_for_post }

  it "has a valid factory" do
    built_post = user.posts.build({ title: post.title, url: post.url })
    built_post.save
    binding.pry
    built_comment = built_post.comments.build({ content: comment_for_post.content })
    expect(built_comment).to be_valid
  end

  describe '#content' do
    it { is_expected.to validate_presence_of(:content) }
  end

end