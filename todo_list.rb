class TodoList
  CannotDoubleDone = Class.new(StandardError)

  def initialize
    @tasks = [] 
  end

  QUESTION = {
    todo_choice: "What are you going to do? A - Add new task, B - Complete the task, C - Finish",
    new_task: "Give the name of new task ",
    done_task: "Give the name of done task " 
  }

  def add_task(task)
    @tasks << task
  end

  def done_task(name)
    task = @tasks.find { |task|
      task.name == name 
    }
    if task.done == true
      cannot_double_done!
    else
      task.done = true
    end
  end

  def list
    @tasks
  end

  def self.question(kind)
    QUESTION[kind]
  end

  def cannot_double_done!
    raise CannotDoubleDone.new("You can't done this task! It's done!")
  end
end