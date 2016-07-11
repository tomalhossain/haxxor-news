require "spec_helper"

describe "Visitor" do

  let!(:user)   { create :user }
  let!(:post)   { create :post }
  let(:comment) { "This is a comment" }
  let(:reply)   { "This is a reply" }

  context "when not logged in" do
    it "cannot create a comment and is redirected to login page" do
      create_comment(comment)
      expect(page).to have_content("You must login to complete that action.")
    end
  end

  context "when logged in" do
    it "can successfully create a comment and is redirected to post page" do
      login(user)
      create_comment(comment)
      expect(page).to have_content(comment)
    end
  end

  it "successfully creates a reply" do
    login(user)
    create_comment(comment)
    create_reply(reply)
    expect(page).to have_content(reply)
  end
end