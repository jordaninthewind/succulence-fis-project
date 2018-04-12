module ApplicationHelper

  # def list_errors(errors)
  #   @errors.messages.each do |e|
  #     content_tag(:div, e.join(" ").gsub("_", " ").capitalize)
  #   end
  # end

  def display_sign_in
    if !current_user
      content_tag(:div, link_to("Log In", new_user_session_path))#, class: "nav-link"), class: "nav-item")
    end
  end
  
  def display_sign_up
    if !current_user
      content_tag(:div, link_to("Sign Up", new_user_registration_path))#, class: "nav-link"), class: "nav-item")
    end
  end
  
  def display_sign_out
    if current_user
      content_tag(:div, link_to("Log Out", destroy_user_session_path, method: :delete))#, :class => 'navbar-link'
    end
  end

  def display_whoami
    if current_user
      # content_tag(:div, "Signed in as #{current_user.email}")#, class: "nav-item") 
      content_tag(:div, "Signed in as #{current_user.username}")#, class: "nav-item") 
    end
  end

  def return_home
    if current_user
      link_to "Home", gardens_path
    end
  end

  # def formatted_time(time)
  #   time.strftime("%m/%d/%Y at %I:%m%p")
  # end
end
