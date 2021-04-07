module Features
  def create_todo(title)
    click_on 'Add Todo'
    fill_in 'Title', with: title
    click_on 'Submit'
  end

  def display_todo(todo_title)
    have_css '.todos li', text: todo_title
  end

  def display_completed_todo(todo_title)
    have_css '.todos li.completed', text: todo_title
  end
end