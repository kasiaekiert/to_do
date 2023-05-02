require 'pry'
require './todo_list'
require './todo_view'
require './task'


module TodoController
  def self.run
    @todo_list = TodoList.new  
    
    user_choice = nil
    while user_choice != "C"
      user_choice = TodoView::customer_reply(TodoList.question(:todo_choice))
      handle_user_choice(user_choice)
    end
  end

  def self.handle_user_choice(user_choice)
    case user_choice 
    when "A"
        name = TodoView::customer_reply(TodoList.question(:new_task))
        task = Task.new(name)
        @todo_list.add_task(task)
    when "B"
        name = TodoView::customer_reply(TodoList.question(:done_task))
        @todo_list.done_task(name)
    end
    TodoView::show_update_list(@todo_list.list)
  end
  
  run
end
