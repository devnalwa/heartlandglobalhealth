require 'rails_helper'

# Capybara really doesn't like interacting with Quill, so I'm puting the desired
# content directly into the 'post_content' input (which is what the quill script
# does with the extracted html). If you have some time, it would be a good idea
# to convert these test to use the actual Quill interface
RSpec.feature "Postings", type: :feature do
  before :each do
    @user = create(:user)
  end

  it "posts users content" do
    visit user_session_path
    fill_in 'Email',    with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit new_post_path
    first('input#post_content', visible: false).set "Hello World"
    click_button 'Submit'
  end
end
