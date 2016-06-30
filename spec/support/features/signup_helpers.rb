module Features
  module SessionHelpers
    def sign_up(name, email, password, password_confirmation)
      visit(new_user_path)
      fill_in('Name', with: name)
      fill_in('Email', with: email)
      fill_in('Password', with: password)
      fill_in('Confirmation', with: password_confirmation)
      click_button('Create my account')
    end
  end
end

