include ApplicationHelper

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

def valid_signin(user)
	fill_in "Email", with: user.email.upcase
    fill_in "Password", with: user.password
    click_button "Sign in" 
# Sign in when not using Capybara as well.
    cookies[:remember_token] = user.remember_token
end

def valid_signup
	fill_in "Name",         with: "Example User"
    fill_in "Email",        with: "user@example.com"
    fill_in "Password",     with: "foobar"
    fill_in "Confirmation", with: "foobar"
end

RSpec::Matchers.define :have_title do |message|
	match do |page|
		page.should have_selector('title', text: message)
	end
end

RSpec::Matchers.define :have_success_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-success', text: message)
	end
end

def signup_error_messages
	it { should have_title('Sign up') }
    it { should have_content('error') }
    it { should have_content('Name can\'t be blank') }
    it { should have_content('Email can\'t be blank') }
    it { should have_content('Email is invalid') }
    it { should have_content('Password can\'t be blank') }
    it { should have_content('Password is too short') }
    it { should have_content('Password confirmation can\'t be blank') }
end

def create_user
    let(:user) { FactoryGirl.create(:user) }
end