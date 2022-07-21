local locale = ...
local widgetList = {}
local layoutList = {}

for i,name in ipairs(love.filesystem.getDirectoryItems(locale .. "/widgets")) do
	print("Widget: ".. name .. " loading...") -- Debugging, Keep
	widgetList[name] = require(... .. ".widgets." .. name)
	print("Widget: ".. name .. " loaded \n")-- Debugging, Keep
end


for i,name in ipairs(love.filesystem.getDirectoryItems(locale .. "/layouts")) do
	name = string.sub(name,1,-5)
	print("Layout: ".. name .. " loading...") -- Debugging, Keep
	layoutList[name] = require(... .. ".layouts." .. name)
	print("Layout: ".. name .. " loaded \n")-- Debugging, Keep
end



--States: "state" is usually dynamic and will change. "requiredState is usually static and stays the same"

return {
	
	cursorFunctions = require(locale .. ".Love2D-CursorFunctions"),
	state = nil,
	objectList = {},

	newObject = function(self,widgetType,params)

		local object = {type="widget"}
		local widget = widgetList[widgetType]
		for k, v in pairs(widget) do
 			object[k] = v
		end


		object.parent = self; object.state = params.state;    object.requiredState = params.requiredState  object.input = false 
		object.objectList = {}

		--Size can be used to scale font size and box size accordingly
		if params.size then--If user is using size rather than width and height
			params.text.font = love.graphics.newFont(params.text.fontName,params.size)
			local font = params.text.font --shortcut
			params.wid = font:getWidth(params.text.string)
			params.hei = font:getHeight()
		end

		if not params.x then params.x = 0 end if not params.y then params.y = 0 end -- If positions dont exist

		object.params = params

		setmetatable(object,self)
		self.__index = self

		--[[self.__newindex = function()

		end]]

		object:initialize(object.params)
		self.objectList[#self.objectList+1] = object

		return object
	end,

	newLayout = function (self,layoutName,params)
		local object = {type="layout"}

		self.objectList = object
		return object
	end,

	removeObject = function(self,object)--table.remove on update

	end,

	getCenterX = function(self)
		local p = self.params
		local x = p.x + (p.wid/2)
		return x
	end,

	getCenterY = function(self)
		local p = self.params
		local y = p.y + (p.hei/2)
		return y
	end,

	changeState = function(self,newState)
		self.state = newState
	end,

	update = require(... .. ".update"),

	draw = require(... .. ".draw"),
}