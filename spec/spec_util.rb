
class SpecUtil

  class << self

    def notPassedWithMessage( msg )
      puts "msg: #{msg}"
      raise StandardError.new( "error message: #{msg}" )
      # expect( true ).to eq( false )
    end
    
    def notPassed( )
      expect( true ).to eq( false )
    end
    
    def passed()
      expect( true ).to eq( true )
    end

    def arrayWithObjectsFromManyTypes( exceptClass=nil)
      types = []
      types << 1
      types << 1.3
      types << "aaa"
      types << StandardError.new
      types << [1,2,3]
      types << Time.now
      types << {"a": 1, "b":2}
      return types if exceptClass.nil?
      types = types.select {|value| value.class != exceptClass}
      return types
    end
  
    def test_execution( block, itShouldPass )
      begin
        msg = nil
        block.call()
        if( !itShouldPass )
          msg = "It was expected an error, but it didn't occur"
        end
      rescue StandardError => exception
        if( itShouldPass )
          msg = "An unexpected error occurred: #{exception.message}"
        end
      end

      if !msg.nil?
        notPassedWithMessage( msg ) 
      end
    end
  end  

end




