module TodoView
  def self.customer_reply(question)
    print question
    gets.chomp
  end

  def self.show_update_list(todolist)
    puts todolist
  end
end