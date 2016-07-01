require 'spec_helper'

describe Comment, type: :model do

  let!(:user) { build :comment }
  let!(:post) { build :post }
  let!(:comment_for_post) { build :comment }

  it "has a valid factory" do
    post_params = { title: post.title, url: post.url }
    comment_params = { content: comment_for_post.content }
    built_post = user.posts.build(post_params)
    built_comment = built_post.comments.build(comment_params)
    expect(built_comment).to be_valid
  end

  describe '#content' do
    it { is_expected.to validate_presence_of(:content) }
  end

end