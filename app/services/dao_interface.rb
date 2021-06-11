class DaoInterface

  #     An useful variable to define if the operation will be commited after 
  # the execution of save method or not.
  attr_reader :transactionActived

  def save( domainObject, transactionActived=false )
      raiseNotImpplemented()
  end

  private

  def raiseNotImpplemented()
      raise "You are trying to call a method inherited from a interface, but not implemented"
  end
end
