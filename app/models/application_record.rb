class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.fromDomainObject( domainObject)
    raiseNotImplemented()
  end

  def raiseNotImplemented()
    raise "You are trying to call a method inherited from a interface, but not implemented"
end
end
