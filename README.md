# To-do List by Ruby

[![terryhycheng](https://circleci.com/gh/terryhycheng/to-do-list-ruby.svg?style=shield)](https://circleci.com/gh/terryhycheng/to-do-list-ruby)

This is my mini project for self-studying Ruby adn TTD. It includes a `Todo` object with several methonds to control a to-do list from a CSV file. Rspec tests and a `yml` file for CircleCI are included.

## Getting Started

To begin with, you should first go to your target directory and download the folder by running `git clone https://github.com/terryhycheng/to-do-list-ruby.git`

This project was developed with `Ruby 3.0` and `RSpec 3.12`. You can check the version in your computer by running `ruby -v` and `rspec -v`. They should be equal to the above version or higher. If not, please update your version before running this project.

## Usage

### Create a CVS file

You will need a CVS file to store your to-dos. Therefore, the first step here is to create one by running `touch data.csv`. Please note that `data.csv` is the default file name for `Todo` object. You can name it with a different name.

### Create a new object

Open `irb` in your terminal and then run the following commands:

First, import the `todo.rb` into `irb`

```ruby
require_relative 'todo.rb'
```

Second, create a new object named `todo`. The `Todo` object can take an argument which is the name of your CVS file.

If you are not using default `data.csv`, please pass your own file name as argument while creating the object. Otherwise, you can leave it blank.

```ruby
# Default CVS file name
todo = Todo.new()

# Your own CVS file name
todo = Todo.new("name-of-your-choice.csv")
```

### Methods available

There are several `public` methods inside `Todo`.

#### `.list`

This will print out all to-dos in the list with a format like this:

```sh
1. This is the 1st to-do
2. This is the 2nd to-do
3. This is the 3rd to-do
```

#### `.add(String)`

This will take a `String` and add it to the to-do list.

#### `.edit(Int, String)`

This will take a todo ID (`Int`) and a new content (`String`) then replace the old content of the todo with the new one.

#### `.delete(Int)`

This will take a todo ID (`Int`) and delete the todo with the same id

## Running Tests

You can execute the tests by simply running `rspec`.
