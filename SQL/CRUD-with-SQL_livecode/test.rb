require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"
require "amazing_print"

# TODO: CRUD some tasks

task = Task.new(title: 'azerty', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')

task.save 

existing_task = Task.find(1)
existing_task.done = true 
existing_task.save
p existing_task
# Task.find(1)
# # => Instance de Task

# p Task.all
# => Tableau d'instances de Task