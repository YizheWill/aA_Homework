module ApplicationHelper
  def auth_token
    # return "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}' >".html_safe
    return "<input type='hidden' name='authenticity_token' value=<%= form_authenticity_token %>".html_safe
    # 很有意思，这个地方不要再写 <%= %>
  end
end
