require_relative 'router'
require_relative 'controller'

require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"
require "amazing_print"

controller = Controller.new
Router.new(controller).start