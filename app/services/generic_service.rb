class GenericService
  attr_reader :dao

  def initialize( dao )
    ValidateUtil.raiseIfValueIsNotA( dao, DaoInterface )
    @dao = dao
  end
end
