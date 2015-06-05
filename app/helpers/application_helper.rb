module ApplicationHelper
	def bootstrap_class_for flash_type
		{ success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
	end
	 
	def flash_messages(opts = {})
	    flash.each do |msg_type, message|
	    	concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
	            	concat content_tag(:button, '×', class: "close", data: { dismiss: 'alert' })
	              	concat message 
	        end)
	   	end
	    nil
	end

	def editor(label,name,id,content)
		html  = "<div class=\"form-group\">"
  		html += "<label class=\"string required control-label\" for=\"#{id}\">"
  		html += "<abbr title=\"required\">*</abbr> #{label}</label>"
  	   	html += quill_editor(name, {value: content})
  		html += "</div>"
  		raw html
	end
end
