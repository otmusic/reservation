module UserMacros

  def login
    setup_account
    log_in
  end

  def logout
    visit destroy_user_session_path
  end
  
  def fill_in_signup_data
    @user_email = 'test@example.com'
    fill_in_user_data(@user_email, 'sign_up')
  end

  private
  
    def setup_account
      @user ||= create(:user, email: 'test@example.com', password: 'password123')
    end  

    def log_in
      fill_in_user_data(@user.email, 'sign_in')
      click_on 'Sign in'
      expect(page).to have_content 'Signed in successfully'
      visit root_path
    end

    def fill_in_user_data(email, action)
      user_action = %w(sign_up).include?(action) ? new_user_registration_path : root_path
      visit user_action
      within('#new_user') do
        fill_in 'Email', with: email
        fill_in 'Password', with: 'password123'
        fill_in('user_password_confirmation', with: 'password123') if %w(sign_up).include?(action)
      end
    end

end