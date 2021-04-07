require 'rails_helper'

feature 'User creates todo' do
  scenario 'successfully' do
    sign_in
    todo = create_todo('Buy milk')
    expect(page).to display_todo('Buy milk')
  end
end