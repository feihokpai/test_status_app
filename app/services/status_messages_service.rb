class StatusMessagesService < GenericService
  def initialize( statusMessagesDao )
    ValidateUtil.raiseIfValueIsNotA( statusMessagesDao, DaoInterface )
    @statusMessagesDao = statusMessagesDao
  end

  def save_status_message( statusMessage )
    ValidateUtil.raiseIfValueIsNotA( statusMessage, StatusMessage )
    @statusMessagesDao.save( statusMessage )
  end
end
