class ApplicationService < GenericService
  
  def initialize( applicationDao=ApplicationDao.new )
    super( applicationDao )
  end

  def get_application( id )
    @dao.get_application( id )
  end
end
