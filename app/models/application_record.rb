class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.fromDomainObject( domainObject)
    raiseNotImplemented()
  end

  def toDomainObject( modelObject )
    raiseNotImplemented()
  end

  private

  def raiseNotImplemented()
    raise "You are trying to call a method inherited from a interface, but not implemented"
end
end
