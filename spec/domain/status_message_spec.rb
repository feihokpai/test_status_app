require_relative "../../app/domain/domain_object.rb"
require_relative "../../app/domain/status_message.rb"
require_relative "../spec_util.rb"

def valid_application
  Application.new("aaa",1)
end

def valid_status_message
  StatusMessage.new( valid_application(), StatusApplication.up(), "aaaa", Time.now, 1 )
end

def initialize_status_message( application, status, message, timestamp, id, itShouldPass )
  # puts "Testing initialize using application #{application}, status #{status} and message '#{message}'. Should It pass? #{itShouldPass}"
  block = -> {StatusMessage.new( application, status, message, timestamp, id )}
  SpecUtil.test_execution( block, itShouldPass)
end

def initialize_status_message_message( message, itShouldPass )
  initialize_status_message( valid_application(), StatusApplication.up(), message, Time.now, nil, itShouldPass )
end

def initialize_status_message_timestamp( timestamp, itShouldPass )
  initialize_status_message( valid_application(), StatusApplication.up(), "aaaa", timestamp, nil, itShouldPass )
end

def initialize_status_message_id( id, itShouldPass )
  initialize_status_message( valid_application(), StatusApplication.up(), "aaaa", Time.now, id, itShouldPass )
end

def set_id( statusMessage, id, itShouldPass )
  # puts "Testing id '#{id}'"
  block = -> { statusMessage.id = id }
  SpecUtil.test_execution( block, itShouldPass)
end

def set_status( statusMessage, status, itShouldPass )
  # puts "Testing status '#{status}'"
  block = -> { statusMessage.status = status }
  SpecUtil.test_execution( block, itShouldPass)
end

def set_message( statusMessage, message, itShouldPass )
  # puts "Testing message '#{message}'"
  block = -> { statusMessage.message = message }
  SpecUtil.test_execution( block, itShouldPass)
end

describe StatusMessage do
  it 'Initialize - application nil' do
    itShouldPass = false
    initialize_status_message( nil, StatusApplication.up(), "aaa", Time.now, nil, itShouldPass )
  end

  it 'Initialize - application with invalid types' do
    itShouldPass = false
    for value in SpecUtil.arrayWithObjectsFromManyTypes()
      initialize_status_message( value, StatusApplication.up(), "aaa", Time.now, nil, itShouldPass )
    end
  end

  it 'Initialize - application with valid values' do
    itShouldPass = true
    initialize_status_message( Application.new("oioi", nil), StatusApplication.up(), "aaa", Time.now, nil, itShouldPass )
    initialize_status_message( Application.new("oioi", 1), StatusApplication.up(), "aaa", Time.now, nil, itShouldPass )
    initialize_status_message( Application.new("$%&&%$", 6865765), StatusApplication.up(), "aaa", Time.now, nil, itShouldPass )
    initialize_status_message( Application.new("234235", 6865765), StatusApplication.up(), "aaa", Time.now, nil, itShouldPass )
  end

  it 'Initialize - status nil' do
    itShouldPass = false
    initialize_status_message( valid_application(), nil, "aaa", Time.now, nil, itShouldPass )
  end

  it 'Initialize - status with invalid types' do
    itShouldPass = false
    for value in SpecUtil.arrayWithObjectsFromManyTypes()
      initialize_status_message( valid_application(), value, "aaa", Time.now, nil, itShouldPass )
    end
  end

  it 'Initialize - status valid' do
    itShouldPass = true
    initialize_status_message( valid_application(), StatusApplication.up(), "aaa", Time.now, nil, itShouldPass )
    initialize_status_message( valid_application(), StatusApplication.down(), "aaa", Time.now, nil, itShouldPass )
  end

  it 'Initialize - message nil, empty and blank' do
    itShouldPass = true
    initialize_status_message_message( nil, itShouldPass )
    initialize_status_message_message( "", itShouldPass )
    initialize_status_message_message( "   ", itShouldPass )
  end

  it 'Initialize - message with invalid types' do
    itShouldPass = false
    for value in SpecUtil.arrayWithObjectsFromManyTypes( String )
      initialize_status_message_message( value, itShouldPass )
    end
  end

  it 'Initialize - message with valid values' do
    itShouldPass = true
    initialize_status_message_message( "aaabbb", itShouldPass )
    initialize_status_message_message( "aaabbb", itShouldPass )
    initialize_status_message_message( "aaa bbb", itShouldPass )
    initialize_status_message_message( "aaa bbb j k jkj   j jklj jj  lllkjkj", itShouldPass )
    initialize_status_message_message( "82736423", itShouldPass )
    initialize_status_message_message( "*&%&&*(", itShouldPass )
    initialize_status_message_message( nil, itShouldPass )
    initialize_status_message_message( "", itShouldPass )
    initialize_status_message_message( " ", itShouldPass )
  end

  it 'Initialize - timestamp with invalid types' do
    itShouldPass = false
    for value in SpecUtil.arrayWithObjectsFromManyTypes( Time )
      initialize_status_message_timestamp( value, itShouldPass )
    end
  end

  it 'Initialize - timestamp nil' do
    itShouldPass = false
    initialize_status_message_timestamp( nil, itShouldPass )
  end

  it 'Initialize - timestamp with valid values' do
    itShouldPass = true
    initialize_status_message_timestamp( Time.now, itShouldPass )
    initialize_status_message_timestamp( Time.now+100, itShouldPass )
    initialize_status_message_timestamp( Time.now-200, itShouldPass )
    initialize_status_message_timestamp( Time.now+1000, itShouldPass )
  end

  it 'Initialize - id nil' do
    itShouldPass = true
    initialize_status_message_id( nil, itShouldPass )
  end

  it 'Initialize - id with invalid types' do
    itShouldPass = false
    for value in SpecUtil.arrayWithObjectsFromManyTypes( Integer )
      initialize_status_message_id( value, itShouldPass )
    end
  end

  it 'Initialize - id with valid values' do
    itShouldPass = true
    for value in -2000..2000
      initialize_status_message_id( value, itShouldPass )
    end
  end

  it 'setId - id with invalid values' do
    itShouldPass = false
    object = valid_status_message()
    for value in SpecUtil.arrayWithObjectsFromManyTypes( Integer )
      set_id( object, value, itShouldPass )
    end
  end

  it 'setId - id with valid values' do
    itShouldPass = true
    object = valid_status_message()
    for value in -2000..2000
      set_id( object, value, itShouldPass )
    end
  end

  it 'setStatus - with invalid values' do
    itShouldPass = false
    object = valid_status_message()
    for value in SpecUtil.arrayWithObjectsFromManyTypes( )
      set_status( object, value, itShouldPass )
    end
    set_status( object, nil, itShouldPass )
  end

  it 'setStatus - with valid values' do
    itShouldPass = true
    object = valid_status_message()
    set_status( object, StatusApplication.up(), itShouldPass )
    set_status( object, StatusApplication.down(), itShouldPass )
  end

  it 'setMessage - with invalid values' do
    itShouldPass = false
    object = valid_status_message()
    for value in SpecUtil.arrayWithObjectsFromManyTypes( String )
      set_message( object, value, itShouldPass )
    end
  end

  it 'setMessage - with valid values' do
    itShouldPass = true
    object = valid_status_message()
    validValues = [ "a","hakjsda78s6dsa6as", "JH J¨% %% ","", " ", "   ", "767682", "&$$&%%&*"]
    for value in validValues
      set_message( object, value, itShouldPass )
    end
  end
end