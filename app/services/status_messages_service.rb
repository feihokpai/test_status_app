class StatusMessagesService < GenericService
  def initialize( statusMessagesDao=StatusMessagesDao.new )
    super( statusMessagesDao )
  end

  def save_status_message( statusMessage )
    @dao.save( statusMessage )
  end

  def get_messages( application, amount )
    @dao.get_messages( application, amount )
  end
end
