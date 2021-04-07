require 'rails_helper'

feature 'User marks todo as incomplete' do
  scenario 'successfully' do
    # Todo.create!(title: 'Buy milk', owner_email: 'someone@example.com')
    sign_in 'someone@example.com'
    create_todo('Buy milk')
    click_on 'Mark complete'
    click_on 'Mark incomplete'
    expect(page).to_not display_completed_todo 'Buy milk'
    expect(page).to display_todo 'Buy milk'

  end
end