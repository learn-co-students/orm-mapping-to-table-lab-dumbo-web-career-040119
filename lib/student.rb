class Student
  attr_accessor :name, :grade
  attr_reader :id
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  def initialize(name, grade, id=nil)
    @name = name
    @grade = grade 
    @id = id 
  end

  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        grade TEXT
        )
        SQL
    DB[:conn].execute(sql) 
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS students
      SQL
    DB[:conn].execute(sql)
  end


  def save 
    sql = <<-SQL
      INSERT INTO students(name, grade)
      values(?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end
  
  def self.create(hash)
    
  end
  
  
   #save
    saves an instance of the Student class to the database (FAILED - 1)
  .create
    takes in a hash of attributes and uses metaprogramming to create a new student object. Then it uses the #save method to save that student to the database (FAILED - 2)
    returns the new object that it instantiated (FAILED - 3)

Failures:

  1) Student #save saves an instance of the Student class to the database
     Failure/Error: expect(josh.id).to eq(1)

       expected: 1
            got: nil

       (compared using ==)
     # ./spec/student_spec.rb:51:in `block (3 levels) in <top (required)>'

  2) Student .create takes in a hash of attributes and uses metaprogramming to create a new student object. Then it uses the #save method to save that student to the database
     Failure/Error:
       def self.create

       end

     ArgumentError:
       wrong number of arguments (given 1, expected 0)
     # ./lib/student.rb:39:in `create'
     # ./spec/student_spec.rb:61:in `block (3 levels) in <top (required)>'

  3) Student .create returns the new object that it instantiated
     Failure/Error:
       def self.create

       end

     ArgumentError:
       wrong number of arguments (given 1, expected 0)
     # ./lib/student.rb:39:in `create'
     # ./spec/student_spec.rb:65:in `block (3 levels) in <top (required)>'

  
end
