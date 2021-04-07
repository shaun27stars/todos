require 'rails_helper'

feature 'User completes todo' do
  scenario 'successfully' do
    Todo.create!(title: 'Buy milk', owner_email: 'someone@example.com')
    sign_in 'someone@example.com'
    click_on 'Mark complete'
    expect(page).to display_completed_todo 'Buy milk'

  end
end