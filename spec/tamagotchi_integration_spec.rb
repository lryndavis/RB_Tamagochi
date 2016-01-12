require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the tamagotchi route', {:type => :feature}) do
  it("brings you to the death page") do
    visit('/')
    click_button("Euthanize")
    expect(page).to have_content("Your Tamagotchi Died :^(")
  end
end
