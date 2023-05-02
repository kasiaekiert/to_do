class Task
  MissingName = Class.new(StandardError)
  
  attr_accessor :name, :done
  
  def initialize(name)
    @name = name
    @done = false

    name_validation!
  end

  def to_s
    name
  end

  def name_validation!
    if @name.nil?
      raise MissingName.new("Name should be present")
    end
  end
end
