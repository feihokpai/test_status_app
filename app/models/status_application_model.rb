class StatusApplicationModel < ApplicationRecord
  self.table_name = "status_applications"  

  def toDomainObject
    StatusApplication.new( self.id, self.description )
  end
end
