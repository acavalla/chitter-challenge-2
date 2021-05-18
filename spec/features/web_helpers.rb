def sign_up
  User.create(email: "acav@gmail.com", password: "password")
end

def create_user_and_sign_in
  visit('/session/new')
  sign_up
  fill_in('email', with: "acav@gmail.com")
  fill_in('password', with: "password")
  click_button('Sign me in!')
end
