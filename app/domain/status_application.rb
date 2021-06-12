class StatusApplication < DomainObject
  attr_reader :code, :description

  STATUS_DOWN = 99
  STATUS_UP = 100

  def initialize( status_, description_ )
    validate_initialize( status_, description_ )
    @code = status_
    @description = description_
  end

  def self.up
    StatusApplication.new( StatusApplication::STATUS_UP, "UP" )
  end

  def self.down
    StatusApplication.new( StatusApplication::STATUS_DOWN, "DOWN" )
  end

  def self.fromCode( code )
    self.raiseIfStatusIsNotValid( code )
    return self.down if code == STATUS_DOWN
    return self.up if code == STATUS_UP
  end

  private

  def validate_initialize( status_, description_ )
    StatusApplication.raiseIfStatusIsNotValid( status_ )
    StringUtil.raiseIfIsEmptyOrNil( description_ )
  end

  def self.raiseIfStatusIsNotValid( status_ )
    ValidateUtil.raiseIfValueIsNotA( status_, Integer )
    return if self.valid_status_list().include?( status_ )
    message = "Tried to create a Status Application with invalid code: #{status_}"
    raise ArgumentError.new( message )
  end

  def self.valid_status_list
    [STATUS_UP, STATUS_DOWN]
  end
end