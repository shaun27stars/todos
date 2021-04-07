require 'rails_helper'

feature 'User completes todo' do
  scenario 'successfully', js: true do
    Todo.create!(title: 'Buy milk', owner_email: 'someone@example.com')
    sign_in 'someone@example.com'
    page.accept_confirm do
      click_on 'Mark complete'
    end
    expect(page).to display_completed_todo 'Buy milk'

  end
end