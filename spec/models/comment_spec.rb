require 'rails_helper'

RSpec.describe Comment, type: :model do 

  it "has a valid factory" do
    expect(create :comment).to be_valid
  end  

  describe '#content' do 
    it { is_expected.to validate_presence_of(:content) }
  end 
  
end 