module HeaderHelper
  
  def display_icon
    return tag.div(class:'header-left') { |tag| link_to 'Cancel', root_path } if current_page?(new_article_path)
    return tag.div(class:'header-left') { |tag| link_to '←', root_path } if profile_page? || comments_page? || followings_page? || followers_page?
    return tag.div(class:'header-left') { |tag| link_to new_article_path do tag.i class: 'fas fa-camera camera-icon fa-lg' end } if (current_page?(articles_path) || current_page?(root_path))
    return tag.div(class:'header-left hidden')
  end

  def display_title
    return tag.div(class:'header-center') { |tag| 'Status' } if current_page?(new_article_path)
    return tag.div(class:'header-center') { |tag| @user.account } if  profile_page?
    return tag.div(class:'header-center') { |tag| 'Comment' } if comments_page?
    return tag.div(class:'header-center') { |tag| 'Followings' } if followings_page?
    return tag.div(class:'header-center') { |tag| 'Followers' } if followers_page?
    return tag.div(class:'header-center hidden')
  end

  def display_btn
    return tag.div(class:'header-right', id:'article-post-btn') { |tag| 'Post' } if current_page?(new_article_path)
    return tag.div(class:'header-left') { |tag| link_to 'Unfollow', api_relationship_path(params[:user_id]), method: 'delete' } if profile_page? && not_my_profile? && has_followed?
    return tag.div(class:'header-left') { |tag| link_to 'Follow', api_relationship_path(params[:user_id]), method: 'post' } if profile_page? && not_my_profile? && !has_followed?
    return tag.div(class:'header-right') { |tag| link_to 'Logout', destroy_user_session_path , method: 'delete' } if (current_page?(articles_path) || current_page?(root_path)) && signed_in?
    return tag.div(class:'header-right') { |tag| link_to 'Login', user_session_path , method: 'post' } if (current_page?(articles_path) || current_page?(root_path)) && !signed_in?
    return tag.div(class:'header-right hidden')
  end

  private

  def followings_page?
    params[:controller] ==  'followings' && params[:action] == 'show'
  end

  def followers_page?
    params[:controller] ==  'followers' && params[:action] == 'show'
  end

  def comments_page?
    params[:controller] ==  'comments' && params[:action] == 'index'
  end

  def profile_page?
    params[:controller] == 'profiles' && params[:action] == 'show'
  end

  def has_followed?
    current_user.following_relationship.exists?(following_id: params[:user_id].to_i)
  end

  def not_my_profile?
    params[:user_id].to_i != current_user.id
  end

end