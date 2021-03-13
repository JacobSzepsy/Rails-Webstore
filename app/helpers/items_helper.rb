module ItemsHelper
	def renderStars(value)
		output = ''
		value.times { output += content_tag(:i, '', class: ['fa', 'fa-star', 'mr-1'], style: 'color: orange; height: 10%') }
	
		remaining = 5 - value
		remaining.times { output += content_tag(:i, '', class: ['fa', 'fa-star-o', 'mr-1'], style: 'color: gray') }
		output.html_safe
	end
end
