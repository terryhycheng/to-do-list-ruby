require_relative "../todo.rb"

describe Todo do
    before (:all) do
        File.new("data_test.csv", "w")
        @Todo = Todo.new("data_test.csv")
    end

    after (:all) do
        File.delete("data_test.csv")
    end

    context ".list" do
        it "should display a correct message when the list is empty" do
            expect{ @Todo.list }.to output("The list is empty.\n").to_stdout
        end
    end

    context ".add" do
        it "should display a message with ID when a new to-do is successfully created" do
            @Todo.add("This is a test")
            expect{ @Todo.list }.to output("1. This is a test\n").to_stdout
        end

        it "should throw an error when no user input is found" do
            expect{ @Todo.add("") }.to output("Invalid input. Please enter again.\n").to_stdout
        end
    end

    context ".edit" do
        it "should update the selected todo with the new content" do
            @Todo.edit(1,"This is an edited content")
            expect{ @Todo.list }.to output("1. This is an edited content\n").to_stdout
        end

        it "should throw an error when user inputs a wrong to-do ID" do
            expect{ @Todo.edit("", "This is an edited content") }.to output("To-do is not found. Please enter again.\n").to_stdout
        end

        it "should throw an error when user inputs empty content" do
            expect{ @Todo.edit(1, "") }.to output("Invalid input. Please enter again.\n").to_stdout
        end
    end

    context ".delete" do
        it "should throw an error when user inputs a wrong to-do ID" do
            expect{ @Todo.delete(3) }.to output("To-do is not found. Please enter again.\n").to_stdout
        end

        it "should throw an error when user inputs an empty string" do
            expect{ @Todo.delete("") }.to output("To-do is not found. Please enter again.\n").to_stdout
        end

        it "should delete a to-do and returns a message with the to-do ID" do
            @Todo.delete(1)
            expect{ @Todo.list }.to output("The list is empty.\n").to_stdout
        end
    end
end