FactoryGirl.define do
	factory :user do
		name      "Buzz Solo"
		email     "buzz@example.com"
		password  "foobar"
		password_confirmation "foobar"
	end
end