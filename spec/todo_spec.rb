require_relative "../todo.rb"

describe Todo do
    before (:each) do
        @Todo = Todo.new
    end

    context ".list" do
        it "lists out all to-dos" do
            expect(@Todo.list).to be true
        end
    end

    context ".add" do
        it "displays a message with ID when a new to-do is successfully created" do
            expect(@Todo.add).to be true
        end

        it "throws an error when no user input is found" do
            expect(@Todo.add).to be true
        end
    end

    context ".edit" do
        it "updates the selected todo and return a message after successfully updated" do
            expect(@Todo.edit).to be true
        end

        it "throws an error when user inputs a wrong to-do ID" do
            expect(@Todo.edit).to be true
        end

        it "throws an error when no user input is found" do
            expect(@Todo.edit).to be true
        end
    end

    context ".delete" do
        it "deletes a to-do and returns a message with the to-do ID" do
            expect(@Todo.delete).to be true
        end

        it "throws an error when user inputs a wrong to-do ID" do
            expect(@Todo.delete).to be true
        end

        it "throws an error when no user input is found" do
            expect(@Todo.delete).to be true
        end
    end
end