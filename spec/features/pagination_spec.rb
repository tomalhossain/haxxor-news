require "spec_helper"

describe "Homepage with less than 20 records", order: :defined do
  before(:context) { FactoryGirl.create_list :post, 15 }
  it "does not paginate records" do
    visit "/"
    expect(page).to have_no_xpath("//*[@class='pagination']//a[text()='2']")
  end
end

describe "Homepage with more than 20 records", order: :defined do
  before(:example) { FactoryGirl.create_list :post, 30 }
  it "paginates records" do
    FactoryGirl.create :post
    visit "/"
    expect(page).to have_xpath("//*[@class='pagination']//a[text()='2']")
    first("//*[@class='pagination']//a[text()='2']").click
    expect(page.status_code).to eq(200)
  end
end
