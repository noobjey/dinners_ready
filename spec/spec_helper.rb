RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.order = :random

  Kernel.srand config.seed

  def test_image_url
    "http://i.livescience.com/images/i/000/048/850/i02/capybara-02.jpg?1324347800"
  end

  def create_item
    @item = Item.create(name: "Hamburger", description: "So delicious.",
      price: 12, image_url: test_image_url, category_id: 2)
  end

  def fill_in_form
    fill_in "Username", with: "Jason"
    fill_in "Password", with: "Noob"
  end

  def default_user
    User.find_by(username: default_username)
  end

  def default_username
    "Jason"
  end

  def default_password
    "Noob"
  end

  def sign_in
    visit root_path
    click_link "Sign In"
    fill_in "Username", with: "Jason"
    fill_in "Password", with: "Noob"
    click_button "Sign In"
  end

  def register_user
    visit login_path
    click_link "Sign Up"

    within(".create-user-form") do
      fill_in_form
      click_button("Sign Up")
    end

    click_link "Sign Out"
    expect(page).to have_content("Sign In")
  end


end
