require "spec_helper"

describe "User" do

  let!(:user) { create :user }
  context "when requests a new password" do
    it "receives the appropriate password reset link via email" do
      expect { reset(user) }.to change { ActionMailer::Base.deliveries.count }.by(1)
      mail = ActionMailer::Base.deliveries[0]
      expect(mail.subject).to eq("Password Reset")
      expect(mail.from[0]).to eq("noreply@haxxornews.com")
      expect(mail.to[0]).to eq(user.email)
      expect(page).to have_content("Please check your email to reset your password.")
    end
  end
end


