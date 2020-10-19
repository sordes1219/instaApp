module HeaderHelper
  
  def display_icon
    return link_to '←', :back if current_page?(profile_path(current_user))
    return link_to 'Cancel', :back if current_page?(new_article_path)
  end

  def display_title
    return current_user.account if current_page?(profile_path(current_user))
    return 'Status' if current_page?(new_article_path)
  end

  def display_btn
    return '' if current_page?(profile_path(current_user))
    return 'Post' if current_page?(new_article_path)
  end

  def hidden_btn(user)
    'hidden' if true
  end

end