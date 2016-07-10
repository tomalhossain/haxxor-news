require "spec_helper"

describe "Navbar" do
  context "when a user is not logged in" do
    it "contains login and signup links in" do
      visit(root_url)
      expect(page).to have_link("Signup", href: new_user_path)
    end
  end
end

describe "Visitor" do
  let!(:user) { build :user }
  context "with a valid email/password confirmation" do
    it "can successfully sign up for a new account" do
      expect { sign_up(user.name, user.email, user.password, user.password) }
               .to change { ActionMailer::Base.deliveries.count }.by(1)
      mail = ActionMailer::Base.deliveries[0]
      expect(mail.subject).to eq("Account Activation")
      expect(mail.from[0]).to eq("noreply@haxxornews.com")
      expect(mail.to[0]).to eq(user.email)
      expect(page).to have_content("Please check your email to activate your account.")
    end
  end

  context "with an invalid email/password confirmation" do
    it "may not sign up for a new account" do
      sign_up("", "123", "", "happy")
      expect(page).to have_content("errors")
    end
  end
end






