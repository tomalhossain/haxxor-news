require 'spec_helper'

RSpec.describe Post, type: :model do 

  it "has a valid factory" do
    expect(create :post).to be_valid 
  end 

  describe '#title' do 
    it { is_expected.to validate_presence_of(:title) }
  end 

  describe '#url' do 
    it { is_expected.to validate_presence_of(:url) }
  end 

end 
