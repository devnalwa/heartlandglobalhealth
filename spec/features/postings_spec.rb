require 'rails_helper'

# Capybara really doesn't like interacting with Quill, so I'm puting the desired
# content directly into the 'post_content' input (which is what the quill script
# does with the extracted html). If you have some time, it would be a good idea
# to convert these test to use the actual Quill interface
RSpec.feature "Postings", type: :feature do
  include Devise::Test::IntegrationHelpers

  before :each do
    @user = create(:user)
  end

  it "posts users content" do
    sign_in @user
    visit new_post_path
    first('input#post_content', visible: false).set "Hello World"
    click_button 'Submit'
    expect(page).to have_content "Hello World"
  end

  it "doesn't post when user is not logged in" do
    visit new_post_path
    expect(current_path).to eq user_session_path
  end
end
