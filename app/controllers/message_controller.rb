class MessageController < ApplicationController

  DEFAULT_APPLICATION_ID = 1
  MAX_MESSAGES_TO_SHOW = 10

  def initialize
    @errorMsg = ""
    @messageService ||= StatusMessagesService.new
    @statusMessageList ||= []
    @applicationService ||= ApplicationService.new
    @defaultApplication = @applicationService.get_application(DEFAULT_APPLICATION_ID)
    super
  end

  def index
    puts "Entrou no index"
    @statusMessageList = @messageService.get_messages( @defaultApplication, MAX_MESSAGES_TO_SHOW )
  end
end
