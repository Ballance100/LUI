local locale = ...
local widgetList = {}

for i,name in ipairs(love.filesystem.getDirectoryItems(locale .. "/widgets")) do
	print("Widget: ".. name .. " loading...") -- Debugging, Keep
	widgetList[name] = require(... .. ".widgets." .. name)
	print("Widget: ".. name .. " loaded \n")-- Debugging, Keep
end




--States: "state" is usually dynamic and will change. "requiredState is usually static and stays the same"

return {
	

	state = nil,
	objectList = {},

	newObject = function(self,widgetType,params)

		local object = {}
		local widget = widgetList[widgetType]
		for k, v in pairs(widget) do
 			object[k] = v
		end


		object.parent = self; object.state = params.state;    object.requiredState = params.requiredState   
		object.objectList = {}

		if not params.x then params.x = 0 end if not params.y then params.y = 0 end -- If positions dont exist

		object.params = params

		setmetatable(object,self)
		self.__index = self

		object:initialize(object.params)
		self.objectList[#self.objectList+1] = object

		return object
	end,

	removeObject = function(self,object)--table.remove on update

	end,

	getCenter = function(self)
		local p = self.params
		local x = p.x + (p.wid/2)
		local y = p.y + (p.hei/2)
		return {x,y}
	end,

	update = require(... .. ".update"),

	draw = require(... .. ".draw"),
}