require 'csv'

class Todo
    def initialize(file_name)
        @file_name = file_name
    end

    # Print out all to-dos
    def list
        if !load_todos.empty?
            load_todos.each do |key, value|
                puts "#{key}. #{value}"
            end
        else
            puts "The list is empty."
        end
    end

    # Take a string and add it to to-do list
    def add(content)
        if content && content != ""
            list = load_todos
            # Check if the list is empty
            if list.length > 0
                list[(list.to_a.last[0] + 1)] = content
            else
                list[1] = content
            end
            save_todos(list)
        else
            puts "Invalid input. Please enter again."
        end
    end

    # Take a todo ID and a new content then replace the old content of the todo with the new one
    def edit(todo_id, content)
        list = load_todos
        if list.has_key?(todo_id)
            if content && content != ""
                list[todo_id] = content
                save_todos(list)
            else
                puts "Invalid input. Please enter again."
            end
        else
            puts "To-do is not found. Please enter again."
        end
    end

    # Take a todo ID and delete the todo with the same id
    def delete(todo_id)
        list = load_todos
        if list.has_key?(todo_id)
            list.delete_if do |key, value|
                key == todo_id
            end
            save_todos(list)
        else
            puts "To-do is not found. Please enter again."
        end
    end

    private

    # Take an array and write each of its item into a CSV
    def save_todos(list)
        CSV.open(@file_name, "wb") do |csv|
            list.each do |key, value|
                csv << [key, value]
            end
        end
    end

    # Read data from a CSV and return an array
    def load_todos
        list = {}
        CSV.foreach(@file_name) do |line|
            id, content = line
            list[id.to_i] = content
        end
        list
    end
end