module ApplicationHelper

  def display_sign_in
    if !session[:user_id]
      content_tag(:li, link_to("sign in", new_user_session_path))#, class: "nav-link"), class: "nav-item")
    end
  end
  
  def display_signup
    if !session[:user_id]
      content_tag(:li, link_to("Sign up", new_user_registration_path))#, class: "nav-link"), class: "nav-item")
    end
  end
  
  def display_whoami
    if session[:user_id]
      content_tag(:li, "Signed in as #{current_user.email}")#, class: "nav-item") 
    end
  end
  
  def display_sign_out
    if session[:user_id]
      link_to "Sign out", destroy_user_session_path, method: :delete#, :class => 'navbar-link'
    end
  end

  def formatted_time(time)
    time.strftime("%m/%d/%Y at %I:%m%p")
  end

end
