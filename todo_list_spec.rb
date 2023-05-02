require 'pry'
require './todo_list'
require './task'


RSpec.describe TodoList, type: :model do
  subject { described_class.new }

  context "adds new tasks to the list" do
    let(:task) { Task.new(task_name) }
    let(:task_name) { "newtask" }

    it "adds new tasks to the list" do
      subject.add_task(task)
      expect(subject.list).to include(task)
    end

    it "is undone be default and change after change to done" do
      subject.add_task(task)
      expect(task.done).to be(false)

      subject.done_task(task_name)
      expect(task.done).to be(true)
    end

    it "is gives error message that cannot be double done" do
      subject.add_task(task)
      expect(task.done).to be(false)

      subject.done_task(task_name)
      expect(task.done).to be(true)

      expect { subject.done_task(task_name) }.to raise_error TodoList::CannotDoubleDone
    end
  end 
  
  context "with many tasks" do
    let(:name1) { "Task1" }
    let(:name2) { "Task2" }

    it "shows the list of a tasks" do
      first_task = Task.new(name1)
      second_task = Task.new(name2)
      subject.add_task(first_task)
      subject.add_task(second_task)
      expect(subject.list).to include(first_task, second_task)
    end
  end

  it "returns the correct question" do
    expect(TodoList.question(:todo_choice)).to eq("What are you going to do? A - Add new task, B - Complete the task, C - Finish")
    expect(TodoList.question(:new_task)).to eq("Give the name of new task ")
    expect(TodoList.question(:done_task)).to eq("Give the name of done task ")
  end
end

