return {
	initialize = function(self,params)
		
	end,

	update = function(self,params,state,dt)
	
	end,

	draw = function(self,params,state)
		local prevColour = {love.graphics.getColor()}
		local prevFont = love.graphics.getFont()
		if params.colour then love.graphics.setColor(params.colour) end

		love.graphics.rectangle("fill",params.x,params.y,params.wid,params.hei)
		love.graphics.setColor(prevColour)

		if params.text then 
			love.graphics.setFont(params.text.font)
			local width = love.graphics.getFont():getWidth(params.text.string)
			local height = love.graphics.getFont():getHeight()
			love.graphics.print(params.text.string,self:getCenterX(),self:getCenterY(),0,1,1,width/2,height/2)
		end
		love.graphics.setFont(prevFont)
	end,

}