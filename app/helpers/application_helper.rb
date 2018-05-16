module ApplicationHelper

  def normalize_time(time)
    time.strftime("%m/%d/%Y at %T")
  end

  def display_sign_in
    if !current_user
      content_tag(:div, link_to("Log In", new_user_session_path))
    end
  end
  
  def display_sign_up
    if !current_user
      content_tag(:div, link_to("Sign Up", new_user_registration_path))
    end
  end
  
  def display_sign_out
    if current_user
      content_tag(:div, link_to("Log Out", destroy_user_session_path, method: :delete))
    end
  end

  def display_whoami
    if current_user
      if current_user.admin
        content_tag(:div, "Signed in as #{current_user.email} - Admin")
      elsif current_user
        content_tag(:div, "Signed in as #{current_user.email}")
      end
    end
  end

  def display_update_account
    if current_user
      content_tag(:div, link_to("Update Account", edit_user_registration_path))
    end
  end

  def gardens_link
    if current_user
      link_to "Gardens", gardens_path
    end
  end

  def plants_link
    if current_user
      link_to "Explore Plants", plants_path
    end
  end

  # def water_link(garden_plant)
  #   if (Time.now - garden_plant.last_watered) < (garden_plant.plant.water_frequency * 86400)
  #     # :div, link_to(
  #       content_tag(link_to "Water Plant", water_plant_path(garden_plant.id))
  #   end
  # end

  # def garden_plants_link
  #   if current_user
  #     link_to "View All of Your Plants", garden_plants_path
  #   end

  # def list_errors(errors)
  #   @errors.messages.each do |e|
  #     content_tag(:div, e.join(" ").gsub("_", " ").capitalize)
  #   end
  # end

  # def formatted_time(time)
  #   time.strftime("%m/%d/%Y at %I:%m%p")
  # end
end
