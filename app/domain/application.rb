class Application < DomainObject
  attr_reader :name

  def initialize( name_ )
    self.name=(name_)
  end

  def name=(name_)
    StringUtil.raiseIfIsEmpty( name_, "An application needs to have a name")
    @name = name_
  end

  private

end