# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper
  def is_correct(answer)
    if answer.correct
      "class='correct'"
    else
      "class='incorrect'"
    end
  end
  
  def ajax_chat(page)
    #se tiver mensagem, passa instrucao de nova mensagem
    if @messages != [] && @messages != nil
      page.insert_html :bottom, 'messages', :partial => 'messages/message', :collection => @messages
      page.assign :message, @messages.last.id 
      page.visual_effect  :highlight, dom_id(@messages.last), :startcolor => "'#99ffcc'"
      page.call 'divScrollToBotton', 'messages'
    end
  end
  
end
