module HeaderHelper
  
  def display_icon
    return tag.div(class:'header-left') { |tag| link_to '←', :back } if current_page?(profile_path(current_user))
    return tag.div(class:'header-left') { |tag| link_to 'Cancel', :back } if current_page?(new_article_path)
    return tag.div(class:'header-left') { |tag| link_to new_article_path do tag.i class: 'fas fa-camera camera-icon fa-lg' end } if current_page?(articles_path)
    return tag.div(class:'header-left hidden')
  end

  def display_title
    return tag.div(class:'header-center') { |tag| current_user.account } if current_page?(profile_path(current_user))
    return tag.div(class:'header-center') { |tag| 'Status' } if current_page?(new_article_path)
    return tag.div(class:'header-center hidden')
  end

  def display_btn
    return tag.div(class:'header-right', id:'article-post-btn') { |tag| 'Post' } if current_page?(new_article_path)
    return tag.div(class:'header-right hidden')
  end

end