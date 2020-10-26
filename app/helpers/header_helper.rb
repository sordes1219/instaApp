module HeaderHelper
  
  def display_icon
    return tag.div(class:'header-left') { |tag| link_to 'Cancel', root_path } if current_page?(new_article_path)
    return tag.div(class:'header-left') { |tag| link_to '←', :back } if params[:controller] == 'profiles' && params[:action] == 'show'  
    return tag.div(class:'header-center') { |tag| link_to '←', :back } if params[:controller] ==  'comments' && params[:action] == 'index'
    return tag.div(class:'header-left') { |tag| link_to new_article_path do tag.i class: 'fas fa-camera camera-icon fa-lg' end } if (current_page?(articles_path) || current_page?(root_path))
    return tag.div(class:'header-left hidden')
  end

  def display_title
    return tag.div(class:'header-center') { |tag| 'Status' } if current_page?(new_article_path)
    return tag.div(class:'header-center') { |tag| @user.account } if params[:controller] == 'profiles' && params[:action] == 'show'
    return tag.div(class:'header-center') { |tag| 'Comment' } if params[:controller] ==  'comments' && params[:action] == 'index'
    return tag.div(class:'header-center hidden')
  end

  def display_btn
    return tag.div(class:'header-right', id:'article-post-btn') { |tag| 'Post' } if current_page?(new_article_path)
    return tag.div(class:'header-left') { |tag| link_to 'Follow', :back } if params[:controller] == 'profiles' && params[:action] == 'show' && params[:id].to_i != current_user.id
    return tag.div(class:'header-right') { |tag| link_to 'Logout', destroy_user_session_path , method: 'delete' } if (current_page?(articles_path) || current_page?(root_path)) && signed_in?
    return tag.div(class:'header-right') { |tag| link_to 'Login', user_session_path , method: 'post' } if (current_page?(articles_path) || current_page?(root_path)) && !signed_in?
    return tag.div(class:'header-right hidden')
  end

end