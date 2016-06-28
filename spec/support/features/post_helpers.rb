module Features
  module PostHelpers
    def create_post(title, url)
      visit(new_post_path)
      fill_in('Title', with: title)
      fill_in('Url', with: url)
      click_button('Create Post')
    end
  end
end

RSpec.configure do |config|
  config.include Features::PostHelpers, type: :feature
end




