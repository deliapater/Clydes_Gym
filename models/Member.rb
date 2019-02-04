require_relative( '../db/sql_runner' )
require_relative('./GymClass.rb')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :premium_membership

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @id = options['id'].to_i if options['id']
    @premium_membership = options['premium_membership']

  end

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      age,
      premium_membership
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @last_name, @age, @premium_membership]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def Member.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run( sql )
    return results.map { |hash| Member.new( hash ) }
  end

  def Member.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run( sql )
  end

  def Member.find( id )
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def Member.delete(id)
    sql = "DELETE FROM members
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def gym_classes()
    sql = "SELECT g.* FROM gym_classes g INNER JOIN bookings b ON b.gym_class_id = g.id WHERE b.member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |gym_class| GymClass.new(gym_class) }
  end

  def update()
    sql = "UPDATE members
    SET
    (
      first_name,
      last_name,
      age,
      premium_membership
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @last_name,@age, @premium_membership, @id]
    SqlRunner.run(sql, values)
  end

end
