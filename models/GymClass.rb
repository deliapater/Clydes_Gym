require_relative( '../db/sql_runner' )

class GymClass

  attr_reader( :id)
  attr_accessor( :title, :capacity)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO gym_classes
    (
      title,
      capacity
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def GymClass.all()
    sql = "SELECT * FROM gym_classes"
    results = SqlRunner.run( sql )
    return results.map { |hash| GymClass.new( hash ) }
  end

  def GymClass.delete_all
    sql = "DELETE FROM gym_classes"
    SqlRunner.run( sql )
  end

  def GymClass.find( id )
  sql = "SELECT * FROM gym_classes
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run( sql, values )
  return GymClass.new( results.first )
end

  def GymClass.delete(id)
    sql = "DELETE FROM gym_classes
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def members()
    sql = "SELECT m.* FROM members m INNER JOIN bookings b ON b.member_id = m.id WHERE b.gym_class_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| GymClass.new(member) }
  end

  def update()
    sql = "UPDATE gym_classes
    SET
    (
      title,
      capacity
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@title, @capacity, @id]
    SqlRunner.run(sql, values)
  end

end
