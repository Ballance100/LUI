

return function(self,dt)
	loop = function(object) --Recursively loops through the subsequent objects inside a parent object 

		if object.type == "widget" then
			if object.requiredState == object.parent.state then
				local params = object.params

				--[[Explanation: LUI modifies postions based on the parent obj. 
					Eg. if you have a frame at x=20 and a button inside said frame with x=10, the button will be drawn at x=30
					In order for LUI to do this following few lines keep the orig coords and reset them back after the cycle
				--]]
				local origX,origY = params.x, params.y
				if object.parent.params then --Checks that parent is not just the lib
					object.params.x = object.params.x + object.parent.params.x
					object.params.y = object.params.y + object.parent.params.y
				end

				--Colour or color? 
				if params.colour then params.color = params.colour
				elseif params.color then params.colour = params.color 
				end 

				if params.colour then
					for _, col in ipairs(params.colour) do
						if col > 1 then --If user is using 255 format rather than 1
							for colI,col in ipairs(params.colour) do
								params.colour[colI] = col/255
							end
						end
					end
				end

				if object.cursorFunctions.IsClicking(1,params.x,params.y,params.wid,params.hei) then
					object.input = "clicking"
					print(1)
				elseif object.cursorFunctions.IsHovering(params.x,params.y,params.wid,params.hei) then
					object.input = "hovering"
				else object.input = false
				end
				
				object:update(object.params, object.state,dt)

				for i,v in ipairs(object.objectList) do
					loop(v)
				end
				params.x,params.y = origX,origY
			end
		elseif object.type == "layout" then
			object:update()
		end
	end

	for i,v in ipairs(self.objectList) do
		loop(v)
	end

end

--[[local function loop(object)
			if object.objectsWidget.update then object.objectsWidget:update(object,object.properties) end
			for i,v in ipairs(object) do
				loop(v)
			end
		end

		for i,v in ipairs(LUI.objectList) do
			loop(v)
		end]]