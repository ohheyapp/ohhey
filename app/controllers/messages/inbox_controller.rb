class Messages::InboxController < ApplicationController
  before_action :authenticate_user!

  def index
    @message_groups = current_user.received_messages.group_by(&:missed_connection)
  end

end

