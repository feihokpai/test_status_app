class StatusApplication < DomainObject
  attr_reader :code

  STATUS_DOWN = 99
  STATUS_UP = 100

  def initialize( status_ )
    validate_initialize( status_ )
    @code = status_
  end

  def self.up
    StatusApplication.new( StatusApplication::STATUS_UP )
  end

  def self.down
    StatusApplication.new( StatusApplication::STATUS_DOWN )
  end

  private

  def validate_initialize( status_ )
    if not valid_status_list().include?( status_ )
      message = "Tried to create a Status Application with invalid code: #{status_}"
      raise ArgumentError.new( message )
    end
  end

  def valid_status_list
    [STATUS_UP, STATUS_DOWN]
  end
end