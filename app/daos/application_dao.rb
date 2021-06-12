class ApplicationDao < DaoInterface
  def get_application( id )
    ApplicationModel.find( id ).toDomainObject()
  end
end
