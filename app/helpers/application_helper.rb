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
end
