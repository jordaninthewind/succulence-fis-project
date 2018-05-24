module PlantsHelper

  def overdue_notice(garden_plant)
    if (Time.now - garden_plant.last_watered) > (garden_plant.plant.water_frequency * 86400)
      content_tag(:div, "Plant is Overdue for Watering!", class: 'alert_class')
    end
  end

end
