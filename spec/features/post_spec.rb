require "spec_helper"

describe "Visitor" do

  let!(:user) { build :user }

  context "when not logged in" do
    it "fails to create a post" do
      create_post("Tomal's Blog", "http://tomalhossain.github.io/")
      expect(page).to have_content("You must login to complete that action.")
    end
  end

  context "when logged in" do
    it "successfully creates a post" do
      login(user)
      create_post("Tomal's Blog", "http://tomalhossain.github.io/")
      expect(page).to have_content("Tomal's Blog")
    end
  end
end



