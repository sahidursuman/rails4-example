module NavbarHelper
  
  def active_tab tab
    (params[:controller] == tab) ? "active" : ""
  end

  def avatar_url(user)
    if user.image_url.present?
      user.image_url
    else
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?r=g&s=30&d=mm"
    end
  end

end
