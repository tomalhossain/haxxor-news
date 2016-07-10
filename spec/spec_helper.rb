require 'rails_helper'
require 'capybara/rspec'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Features::SessionHelpers, type: :feature
  config.include Features::PostHelpers, type: :feature
  config.include Features::SessionHelpers, type: :feature
  config.include Features::ResetHelpers, type: :feature
  config.include Features::CommentHelpers, type: :feature

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
