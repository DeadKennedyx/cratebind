require "rails_helper"

RSpec.feature "User Features", type: :feature do
  context "create new user" do
    before(:each) do
      visit "/users/sign_up"
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Email", with: "john.doe@example.com"
        fill_in "Password", with: "test1234"
        fill_in "Password confirmation", with: "test1234"
      end
      click_button "Sign up"
      expect(page).to have_content "Projects:"
    end

    scenario "should fail" do
      click_button "Sign up"
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
    end
  end

  context "login user" do
    before(:each) do
      visit "/users/sign_in"
      create(:user)
    end
    scenario "should be successful" do
      within("form") do
        fill_in "Email", with: "joe@gmail.com"
        fill_in "Password", with: "test123"
      end
      find(:xpath, "//input[contains(@name, 'commit')]").click()
      expect(page).to have_content "Projects:"
    end

    scenario "should fail" do
      find(:xpath, "//input[contains(@name, 'commit')]").click()
      expect(page).to have_content "Log in"
    end
  end
end
