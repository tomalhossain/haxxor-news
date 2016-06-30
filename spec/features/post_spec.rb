require 'spec_helper'

describe "Post" do

  let!(:user) { create :user }

  context "when not logged in" do
    it "redirects to login path" do
      create_post("Tomal's Blog", "http://tomalhossain.github.io/")
      expect(page).to have_content("You must login to complete that action.")
    end
  end

  context "when logged in" do
    it "successfully creates a post" do

      log_in(user)
      create_post("Tomal's Blog", "http://tomalhossain.github.io/")
      expect(page).to have_content("Tomal's Blog")
    end
  end
end

