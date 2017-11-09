require 'rails_helper'

# Capybara really doesn't like interacting with Quill, so I'm puting the desired
# content directly into the 'post_content' input (which is what the quill script
# does with the extracted html). If you have some time, it would be a good idea
# to convert these test to use the actual Quill interface
RSpec.feature "Postings", type: :feature do
  it "posts users content" do
    visit new_post_path
    first('input#post_content', visible: false).set "Hello World"
    click_button 'Submit'
  end

  it "doesn't allow script injection" do
    visit new_post_path
    first('input#post_content', visible: false).set "<script>alert('hahaha');</script>"
    click_button 'Submit'
    expect(page).to have_content "Hello World"
  end

  it "doesn't allow style injection" do
  end

  it "doesn't allow empty posts" do
  end
end