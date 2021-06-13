require_relative "../../app/domain/domain_object.rb"
require_relative "../../app/domain/application.rb"
require_relative "../spec_util.rb"

def test_initialize_app( name, id, itShouldPass )
  # puts "Testing initialize using name #{name} and id #{id}. Should It pass? #{itShouldPass}"
  block = -> {Application.new( name, id )}
  SpecUtil.test_execution( block, itShouldPass)
end

describe Application do
  it 'Initialize - name nil' do
    itShouldPass = false
    test_initialize_app( nil, 1, itShouldPass )
  end

  it 'Initialize - name String empty' do
    itShouldPass = false
    test_initialize_app( nil, 1, itShouldPass )
  end

  it 'Initialize - name invalid types' do
    itShouldPass = false
    test_initialize_app( 1, 1, itShouldPass )
    test_initialize_app( [], 1, itShouldPass )
    test_initialize_app( 1.5, 1, itShouldPass )
    test_initialize_app( ArgumentError.new, 1, itShouldPass )
    test_initialize_app( {}, 1, itShouldPass )
    test_initialize_app( " ", 1, itShouldPass )
    test_initialize_app( "  ", 1, itShouldPass )
    test_initialize_app( "   ", 1, itShouldPass )
  end

  it 'Initialize - name with valid values' do
    itShouldPass = true
    test_initialize_app( "Maria Carla", 1, itShouldPass )
    test_initialize_app( "Maria Carla jhhjh  hkjhjkhk h hjkhkhkjhkjhjkhjkhkjhkjhkjhkjhkhkjhkjjgjhajdsagdsgags", 1, itShouldPass )
    test_initialize_app( "Top", 1, itShouldPass )
    test_initialize_app( "$%%&%&%", 1, itShouldPass )
    test_initialize_app( "566785", 1, itShouldPass )    
  end

  it 'Initialize - id nil' do
    itShouldPass = true
    test_initialize_app( "Application", nil, itShouldPass )
  end

  it 'Initialize - id some Invalid Types' do
    itShouldPass = false
    test_initialize_app( "Application", "aaa", itShouldPass )
    test_initialize_app( "Application", 1.5, itShouldPass )
    test_initialize_app( "Application", [1,2], itShouldPass )
    test_initialize_app( "Application", {"a": 3}, itShouldPass )
    test_initialize_app( "Application", StandardError.new, itShouldPass )
  end

  it 'Initialize - id some valid values' do
    itShouldPass = true
    for id in -2000..2000
      test_initialize_app( "Application", id, itShouldPass )
    end
  end
end  