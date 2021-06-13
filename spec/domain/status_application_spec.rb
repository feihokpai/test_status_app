require_relative "../../app/domain/domain_object.rb"
require_relative "../../app/domain/status_application.rb"
require_relative "../../app/util/validate_util.rb"
require_relative "../../app/util/string_util.rb"
require_relative "../spec_util.rb"

def test_initialize( code, description, itShouldPass )
  # puts "Testing initialize using code #{code} and description #{description}. Should It pass? #{itShouldPass}"
  block = -> {StatusApplication.new( code, description )}
  SpecUtil.test_execution( block, itShouldPass)
end

def test_fromCode( code, itShouldPass )
  # puts "Testing fromCode using code #{code}. Should It pass? #{itShouldPass}"
  block = -> {StatusApplication.fromCode( code )}
  SpecUtil.test_execution( block, itShouldPass)
end

describe StatusApplication do
  it 'Initialize - status nil' do
    itShouldPass = false
    test_initialize( nil, "aaaa", itShouldPass )
  end

  it 'Initialize - status String from a valid code' do
    itShouldPass = false
    test_initialize( "99", "aaaa", itShouldPass )
  end

  it 'Initialize - status Integer that is an invalid code' do
    itShouldPass = false
    test_initialize( 56, "aaaa", itShouldPass )
  end

  it 'Initialize - status with valid codes' do
    itShouldPass = true
    test_initialize( StatusApplication::STATUS_UP, "aaaa", itShouldPass )
    test_initialize( StatusApplication::STATUS_DOWN, "aaaa", itShouldPass )
  end

  it 'Initialize - description nil' do
    itShouldPass = false
    test_initialize( StatusApplication::STATUS_UP, nil, itShouldPass )
  end

  it 'Initialize - description string empty' do
    itShouldPass = false
    test_initialize( StatusApplication::STATUS_UP, "", itShouldPass )
  end

  it 'Initialize - description array' do
    itShouldPass = false
    test_initialize( StatusApplication::STATUS_UP, [1,2,3], itShouldPass )
  end

  it 'Initialize - description Integer' do
    itShouldPass = false
    test_initialize( StatusApplication::STATUS_UP, 1, itShouldPass )
  end

  it 'Initialize - description with valid values' do
    itShouldPass = true
    test_initialize( StatusApplication::STATUS_UP, "aaa", itShouldPass )
    test_initialize( StatusApplication::STATUS_UP, "Doido", itShouldPass )
    test_initialize( StatusApplication::STATUS_UP, "Maracanã", itShouldPass )
    test_initialize( StatusApplication::STATUS_UP, " ", itShouldPass )
    test_initialize( StatusApplication::STATUS_UP, "@$%%*&", itShouldPass )
  end

  it 'fromCode() - code nil' do
    itShouldPass = false
    test_fromCode( nil, itShouldPass )
  end

  it 'fromCode() - String from an integer that is a valid code' do
    itShouldPass = false
    test_fromCode( StatusApplication::STATUS_UP.to_s(), itShouldPass )
    test_fromCode( StatusApplication::STATUS_DOWN.to_s(), itShouldPass )
  end

  it 'fromCode() - Integer that is an invalid code' do
    itShouldPass = false
    test_fromCode( 45, itShouldPass )
    test_fromCode( 5, itShouldPass )
    test_fromCode( 1, itShouldPass )
    test_fromCode( 9, itShouldPass )
  end

  it 'fromCode() - Valid codes' do
    itShouldPass = true
    test_fromCode( StatusApplication::STATUS_UP, itShouldPass )
    test_fromCode( StatusApplication::STATUS_DOWN, itShouldPass )
  end
  
end