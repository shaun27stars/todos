module Features
  def sign_in(email = 'person@example.com')
    visit root_path
    fill_in 'Email', with: email
    click_on 'Sign in'
  end
end