require 'spec_helper'

describe "UserPages" do
	subject { page }
  
	describe "sign up page" do
	 before { visit signup_path }
	    
	 it { should have_content('Sign up') }
	 it { should have_titile(full_title('Sign up')) }
  	end
end
