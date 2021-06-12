class SpecUtil

  class << self
    def notPassedWithMessage( msg )
      puts "msg: #{msg}" 
      expect( true ).to eq( false )
    end
    
    def notPassed( )
      expect( true ).to eq( false )
    end
    
    def passed()
      expect( true ).to eq( true )
    end
  
    def test_execution( block, itShouldPass )
      begin
        block.call()
        if( !itShouldPass )
          notPassedWithMessage( "It was expected an error, but it didn't occur" )
        end
      rescue StandardError => exception
        if( itShouldPass )
          notPassedWithMessage( "An unexpected error occurred." )
        end
      end
    end
  end  

end




