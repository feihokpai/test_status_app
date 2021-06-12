class StatusMessage < DomainObject
  attr_reader :message, :timestamp, :application, :status, :id

  def initialize( application_, status_, message_, timestamp_=Time.now, id_=nil)
    validate_initialize( application_, timestamp_, id_)    
    self.id=(id_)
    self.message=(message_)
    self.status=(status_)
    @timestamp = timestamp_    
    @application = application_
  end

  def message=(message_)
    ValidateUtil.raiseIfValueIsNotA( message_, String )
    @message = message_
  end

  def status=( status_ )
    ValidateUtil.raiseIfValueIsNotA( status_, StatusApplication )
    @status = status_
  end

  def id=( id_ )
    ValidateUtil.raiseIfValueIsNotNilAndIsNotA( id_, Integer )
    @id = id_
  end

  private

  def validate_initialize( application_, timestamp_, id_)
    ValidateUtil.raiseIfValueIsNotA( application_, Application )
    ValidateUtil.raiseIfValueIsNotA( timestamp_, Time )    
  end

end