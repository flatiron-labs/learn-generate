require_relative 'environment'

class SQLRunner
  def initialize(db)
    @db = db
  end

  def execute_sql_file
    sql = File.read("lib/%{file_name}.sql")
    execute_sql(sql)
  end

  def execute_sql(sql)
     sql.scan(/[^;]*;/m).each { |line| @db.execute(line) } unless sql.empty?
  end
end