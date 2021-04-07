require 'rails_helper'

feature 'User sees own todos' do
  scenario "doesn't see others' todos" do
    Todo.create!(title: 'Buy milk', owner_email: 'someone_else@example.com')
    sign_in 'someone@example.com'

    expect(page).not_to display_todo('Buy milk')
  end
end