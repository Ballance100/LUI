# LUI (LOO-eye)
### A light weight, customisable UI library for Love2D




## Setup
```lua
LUI = require "LUI"
```


### Creating first object

Although the idea is to make your own widgets, there are a few demo ones for you to use to try out the lib

You can create an object like so 

```lua
LUI:newObject(widgetName,params)

--Eg
button1 = LUI:newObject("button",{x=0,y=0,wid=20,hei=20})
```

You can store objects within objects as well

```lua
button2 = button1:newObject("button",{x=50,y=40,wid=20,hei=20})
```

### Update and Draw
```lua
function love.update(dt)
	LUI:update(dt)
end

function love.draw(dt)
	LUI:draw(dt)
end
```

Using LUI:draw()/update() will update all objects
You can also draw and update individual objects

```lua
function love.update(dt)
	button2:update(dt)
end
```

## States
