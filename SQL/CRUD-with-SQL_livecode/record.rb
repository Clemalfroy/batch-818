class Record
  def initialize
    
  end

  attr_reader :id, :description
  attr_accessor :done, :title

  def initialize(attributes ={})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || false
  end

  def self.find(id)
    DB.results_as_hash = true
    row = DB.execute("select * from tasks where id = ?", id).first
    build_task(row)

  end

  

  def save
    if @id.nil?
      DB.execute("INSERT INTO tasks (title, description, done) VALUES (?,?,?)", @title, @description, @done ? 1 : 0)
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE tasks SET title = ?, description = ?, done = ? WHERE id = ?", @title, @description, @done ? 1 : 0, @id)
    end
  end

  def self.all 
    DB.results_as_hash = true
    rows = DB.execute("select * from tasks")
    rows.map {|row| build_task(row) }
  end

  def self.build_task(row)
    Task.new(
      id: row['id'], 
      title: row['title'], 
      description: row['description'], 
      done: row['done'] == 1, 
    )
  end
end