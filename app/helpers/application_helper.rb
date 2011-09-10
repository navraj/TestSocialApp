module ApplicationHelper
  
  def full_name user = current_user
    return "#{user.fname.capitalize} #{user.lname.capitalize}"
  end
  
  def recent_user_list(list=10)
    html = ''
    users = User.limit(10).order('created_at DESC')
    users.each do |user|
       html << content_tag(:li) do
          link_to "#{user.fname.capitalize} #{user.lname.capitalize}", wall_post_path(user.id)
       end
    end
    return raw html
  end  
end
