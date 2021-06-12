class MessageController < ApplicationController

  DEFAULT_APPLICATION_ID = 1
  MAX_MESSAGES_TO_SHOW = 10

  def initialize
    @messageToUser = ""
    @messageService ||= StatusMessagesService.new
    @statusMessageList ||= []
    @applicationService ||= ApplicationService.new
    @defaultApplication = @applicationService.get_application(DEFAULT_APPLICATION_ID)
    super
  end

  def index
    load_messages_list()
  end

  def save
    save_message_from_params()
    load_messages_list()
    render :index
  end

  private

  def load_messages_list
    @statusMessageList = @messageService.get_messages( @defaultApplication, MAX_MESSAGES_TO_SHOW )
  end

  def save_message_from_params
    begin
      statusCode = params[:status_code].to_i()
      message = params[:status_message]
      statusApplication = StatusApplication.fromCode( statusCode )
      statusMessage = StatusMessage.new( @defaultApplication, statusApplication, message )
      @messageService.save_status_message( statusMessage )
    rescue StandardError => exception
      @messageToUser = "An Unexpected error ocurred: #{exception.message}"
      ExceptionUtil.printLinesOfBackTrace( exception, 10 )
    end
  end

end
