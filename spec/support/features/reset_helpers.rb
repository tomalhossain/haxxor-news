module Features
  module ResetHelpers
    def reset(user)
      visit(root_url)
      click_link("Login")
      click_link("forgot password")
      fill_in("Email", with: user.email)
      click_button("Reset")
    end
  end
end

