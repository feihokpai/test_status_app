class StatusMessageModel < ApplicationRecord
  self.table_name = "status_messages"  
  belongs_to :application, :class_name => "ApplicationModel", :foreign_key => "application_id", required: true  
  belongs_to :statusApplication, :class_name => "StatusApplicationModel", :foreign_key => "status_application_id", required: true

  def self.fromDomainObject( statusMessage )
    applicationModel = ApplicationModel.where( id: statusMessage.application.id ).first
    statusApplicationModel = StatusApplicationModel.where( id: statusMessage.status.code ).first
    params = { application: applicationModel, statusApplication: statusApplicationModel, message: statusMessage.message }
    statusMessageModel = StatusMessageModel.new( params )
    return statusMessageModel
  end
end
