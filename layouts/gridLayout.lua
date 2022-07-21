--Params = {x=0,y=0,cols=1,rows=1,wid=1920,hei=1080}

return {update = function(self,params,objectsList)--used on Update and draw function
	if params.hei then --Base object size on height/wid of grid layout; otherwise, don't

		for i,v in ipairs(objectsList) do--Loops through all object in the grid layout. where vars are changed to match size/pos
			
		end

	end
end,}