describe "the signin process", type: :feature do
  before :each do
   @user = create(:user)
  end

  it "signs me in" do
    visit user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end
