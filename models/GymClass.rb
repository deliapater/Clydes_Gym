require_relative( '../db/sql_runner' )

class GymClass

  attr_reader( :id)
  attr_accessor( :title, :capacity, :time, :date_class, :premium_class)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @capacity = options['capacity'].to_i
    @time = options['time']
    @date_class = options['date_class']
    @premium_class = options['premium_class']
  end


  def premium_gym()
      if @premium_class == "true"
      return true
    end
  end

  def left_spaces()
    members_booked = self.members().count()
    if members_booked < @capacity
      return true
    end
  end

  def save()
    sql = "INSERT INTO gym_classes
    (
      title,
      capacity,
      time,
      date_class,
      premium_class
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@title, @capacity, @time, @date_class, @premium_class]
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
    return results.map { |member| Member.new(member) }
  end

  def update()
    sql = "UPDATE gym_classes
    SET
    (
      title,
      capacity,
      time,
      date_class,
      premium_class
      ) =
      (
        $1, $2, $3, $4, $5
      )
      WHERE id = $6"
      values = [@title, @capacity, @time, @date_class, @premium_class, @id]
      SqlRunner.run(sql, values)
    end

  end
