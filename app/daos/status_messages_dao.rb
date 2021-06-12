class StatusMessagesDao < DaoInterface
  def save( statusMessage, transactionActived=false )
    validate_save( statusMessage, transactionActived )
    save_status_message( statusMessage )
  end

  def get_messages( application, amount )
    validate_get_messages( application, amount )
    modelsArray = StatusMessageModel.where( application_id: application.id )
      .order(:updated_at)
      .reverse_order
      .take( amount )
    modelsArray.map{ |model| model.toDomainObject() }
  end

  private 

  def validate_save( statusMessage, transactionActived )
    ValidateUtil.raiseIfValueIsNotA( statusMessage, StatusMessage )
    ValidateUtil.raiseIfValueIsNotABoolean( transactionActived )
  end

  def validate_get_messages( application, amount )
    ValidateUtil.raiseIfValueIsNotA( application, Application )
    ValidateUtil.raiseIfValueIsNotA( amount, Integer )
  end

  def save_status_message( statusMessage )
    statusMessageModel = StatusMessageModel.fromDomainObject( statusMessage )
    statusMessageModel.save!()
  end
end
