class ApplicationModel < ApplicationRecord
  self.table_name = "applications"  

  def self.fromDomainObject( application )
    ValidateUtil.raiseIfValueIsNotA( application, Application )
    ApplicationModel.new( id: application.id, name: application.name )
  end

  def toDomainObject
    Application.new( self.name, self.id )
  end
end
