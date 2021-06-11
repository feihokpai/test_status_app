class StatusMessagesDao < DaoInterface
  def save( statusMessage, transactionActived=false )
    validate_save( statusMessage, transactionActived )
    save_status_message( statusMessage )
  end

  private 

  def validate_save( statusMessage, transactionActived )
    ValidateUtil.raiseIfValueIsNotA( statusMessage, StatusMessage )
    ValidateUtil.raiseIfValueIsNotABoolean( transactionActived )
  end

  def save_status_message( statusMessage )
    statusMessageModel = StatusMessageModel.fromDomainObject( statusMessage )
    statusMessageModel.save!()
  end
end
