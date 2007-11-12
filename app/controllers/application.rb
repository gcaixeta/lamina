# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  include AuthenticatedSystem
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_per_session_id'
  
  def ajax_chat(group, message)
    participations = group.participation_ids
    if  message == 0
      @messages = Message.find(:all,  :limit => 10, :conditions => [ "participation_id IN (?) and id > ?", participations, message])
    elsif  message > 0
      @messages = Message.find(:all,  :limit => 10, :conditions => [ "participation_id IN (?) and id > ?", participations, message])
    end
    
    if @messages != []
      
    end
    
  end
end
