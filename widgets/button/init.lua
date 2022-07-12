return {
	initialize = function(self,params)
		
	end,

	update = function(self,params,state,dt)
	
	end,

	draw = function(self,params,state)
		local prevColour = {love.graphics.getColor()}
		if params.colour then love.graphics.setColor(params.colour) end

		love.graphics.rectangle("fill",params.x,params.y,20,20)
		love.graphics.setColor(prevColour)
	end,

}