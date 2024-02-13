# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  # Using LS version for add, as it is more concise:
  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    todos << todo
  end
  alias_method :add, :<<

  # def add(item)
  #   if item.class == Todo
  #     self.todos.push(item)
  #   else
  #     raise TypeError, "Can only add Todo objects"
  #   end
  #   todos
  # end

  # def <<(item)
  #   self.add(item)
  # end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  # I thought to_a was to print array, but I read incorrectly...
  def to_a
    todos.clone
  end

  # def to_a
  #   todos.each { |item| puts item }
  # end

  def done?
    todos.all? { |item| item.done? }
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end
  
  def mark_undone_at(index)
    item_at(index).undone!
  end

  # LS version is longer, but utilizes custom method, so makes more sense
  def done!
    todos.each_index do |index|
      mark_done_at(index)
    end
  end

  # def done!
  #   todos.each(&:done!)
  # end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete(item_at(index))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << todos.map(&:to_s).join("\n")
    text
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
p list.size == 3                      # returns 3

# first
p list.first == todo1                     # returns todo1, which is the first item in the list

# last
p list.last == todo3                      # returns todo3, which is the last item in the list

#to_a
list.to_a                      # returns an array of all items in the list

#done?
p list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
p list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
list.to_a
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
list.to_a
# list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done
list.to_a

# ---- Deleting from the list -----

# shift
# p list.shift                      # removes and returns the first item in list

# pop
# p list.pop                        # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.to_a
# list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
puts list                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym