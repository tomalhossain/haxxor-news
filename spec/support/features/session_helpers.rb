module Features
  module SessionHelpers
    def login(user)
      user.update_attributes(activated: true)
      visit(root_url)
      click_link('Login')
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      click_button('Log in')
    end
  end
end

