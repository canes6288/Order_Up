module FeatureMacros
	def sign_in(user)
		visit new_user_session_path

		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: user.password

		click_on 'Log in'
	end

	def find_first_action(action)
		first(action_selector(action))
	end

	def find_last_action(action)
		all(action_selector(action)).last
	end

	def find_all_actions(action)
		all(action_selector(action))
	end

	private

		def action_selector(action)
			"[data-action='#{action}']"
		end
end

RSpec.configure do|config|
	config.include FeatureMacros, type: :feature
end