class Application < DomainObject
  attr_reader :name, :id

  def initialize( name_, id_=nil )
    self.name=(name_)
    self.id=(id_)
  end

  def name=(name_)
    StringUtil.raiseIfIsEmpty( name_, "An application needs to have a name")
    @name = name_
  end

  def id=(id_)
    if !id_.nil?
      ValidateUtil.raiseIfValueIsNotA( id_ , Integer )
    end
    @id = id_
  end

  private

end