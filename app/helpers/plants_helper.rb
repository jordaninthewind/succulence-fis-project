module PlantsHelper

	# def set_garden_plant(garden, plant)
	# 	@plant = 
	# end
  def overdue_notice(garden_plant)
    if (Time.now - garden_plant.last_watered) > (garden_plant.plant.water_frequency * 86400)
      content_tag(:div, "Plants Are Overdue, Water Plant.")
    end
  end

end
