require 'spec_helper'

describe 'Visitor' do

  context 'when not logged in' do
    it 'signup link should be present in navbar' do
      visit(root_url)
      expect(page).to have_link("Signup", href: new_user_path)
    end
  end

  context 'with valid email and password' do
    it 'should successfully sign up user 'do
      sign_up("Alphabet Soup", "alphabet@soup.com", "password", "password")
      expect(page).to have_content("Please check your email to activate your account.")
    end
  end
end


