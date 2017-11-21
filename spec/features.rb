describe "the signin process", :type => :feature do
  before :each do
   @user_1 = Factory.create(:user, :email => 'aaa@grinnell.edu', :password => 'aaaaaa')
  end

  it "signs me in" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', with: 'aaa@grinnell.edu'
      fill_in 'Password', with: 'aaaaaa'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end