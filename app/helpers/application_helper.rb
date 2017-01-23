module ApplicationHelper
	def full_title(page_title = "")
		base_title = "水しるべ調査"
	end
	def show_dat(time)
    return time unless time
    time.strftime("%Y/%m/%d")
  end

  def show_at(time)
    return time unless time
    time.strftime("%Y/%m/%d %H:%M:%S")
  end
end
