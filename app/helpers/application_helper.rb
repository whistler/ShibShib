module ApplicationHelper
	include AutoHtml
	def javascript(*args)
	  content_for(:head) { javascript_include_tag(*args) }
	end


	def title
		base_title = "ShibShib"
		if @title.nil?
			base_title
		else
			"#{base_title} - #{@title}"
		end
	end
end
