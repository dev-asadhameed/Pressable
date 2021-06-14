module ApplicationHelper
  def flash_msg
    flash.each_with_object([]) do |(type, message), flash_messages|
      text = "<div class='flash-msg'>
                <div class='card text-white rounded-3 bg-#{type == 'error' ? 'danger' : type} mb-3 friend-card'>
                  <div class='card-body'>
                    <h4 class='card-title'>#{message} <i class='bi bi-emoji-#{emoji(type)}'></i></h4>
                  </div>
                </div>
              </div>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end

  def emoji(type)
    type == 'success' ? 'smile' : 'neutral'
  end
end
