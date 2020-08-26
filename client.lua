local screen = Vector2( guiGetScreenSize() )
local DVD = {}
dvdLogo = dxCreateTexture( 'files/dvd_logo.png', 'argb' ) -- Cоздание текстуры логотипа

-- [[ ФУНКЦИЯ КОТОРАЯ ГЕНЕРИРУЕТ СЛУЧАЙНЫЙ ЦВЕТ ]] --
function rndCol()
    return tocolor(math.random(0, 255), math.random(0, 255), math.random(0, 255), 255)
end

local randomspeed = math.random(0.4, 0.9) -- генерируем случайную скорость движение логотипа

local lDVDAnimatedPosX, rDVDAnimatedPosX  = randomspeed, randomspeed -- задаем случайную скорость движения
local lDVDAnimatedPosY, rDVDAnimatedPosY = randomspeed, randomspeed -- задаем случайную скорость движения

-- [[ РАЗМЕР ЛОГОТИПА ]] --

local dvdLogoSizeX, dvdLogoSizeY = 180, 108 -- размер логотипа

-- [[ ЛЕВЫЙ ЛОГОТИП ]] --

local lDVDPosX, lDVDPosY = math.random(dvdLogoSizeX, screen.x/2), math.random(dvdLogoSizeY, screen.y) -- случайное положение логотипа при старте ресурса
local lDVDCol = rndCol() -- случайный цвет при старте ресурса

-- [[ ПРАВЫЙ ЛОГОТИП ]] --

local rDVDPosX, rDVDPosY = math.random(dvdLogoSizeX, screen.x/2), math.random(dvdLogoSizeY, screen.y) -- случайное положение логотипа при старте ресурса
local rDVDCol = rndCol() -- случайный цвет при старте ресурса

function DVD.Draw ()
	-- [[ ОТРИСОВКА 2УХ ПРЯМОУГОЛЬНИКОВ НА 2УХ ЧАСТЯХ ЭКРАНА ]] --
	dxDrawRectangle(0, 0, screen.x/2, screen.y, tocolor(20,20,20))
	dxDrawRectangle(screen.x/2, 0, screen.x/2, screen.y, tocolor(10,10,10))
	
	-- [[ ЛЕВАЯ ЧАСТЬ ]] --
	lDVDPosX = lDVDPosX + lDVDAnimatedPosX
	lDVDPosY = lDVDPosY + lDVDAnimatedPosY
	
	
	if lDVDPosX + dvdLogoSizeX > screen.x/2.0 then
		lDVDPosX = screen.x/2.0 - dvdLogoSizeX
		lDVDAnimatedPosX = -lDVDAnimatedPosX
        lDVDCol = rndCol()
        
	elseif lDVDPosX < 0 then
		lDVDPosX = 0
		lDVDAnimatedPosX = -lDVDAnimatedPosX
		lDVDCol = rndCol()
	end
	
	if lDVDPosY + dvdLogoSizeY > screen.y then
		lDVDPosY = screen.y - dvdLogoSizeY
		lDVDAnimatedPosY = -lDVDAnimatedPosY
		lDVDCol = rndCol()
	elseif lDVDPosY < 0 then
		lDVDPosY = 0
		lDVDAnimatedPosY = -lDVDAnimatedPosY
		lDVDCol = rndCol()
	end
	
	dxDrawImage(lDVDPosX, lDVDPosY, dvdLogoSizeX, dvdLogoSizeY, dvdLogo, 0, 0, 0, lDVDCol)
	
	-- [[ ПРАВАЯ ЧАСТЬ ]] --
	
	rDVDPosX = rDVDPosX + rDVDAnimatedPosX
    rDVDPosY = rDVDPosY + rDVDAnimatedPosY

    if rDVDPosX + dvdLogoSizeX > screen.x then
		rDVDPosX = screen.x - dvdLogoSizeX
		rDVDAnimatedPosX = -rDVDAnimatedPosX
        rDVDCol = rndCol()
        
	elseif rDVDPosX < screen.x/2.0 then
		rDVDPosX = screen.x/2.0
		rDVDAnimatedPosX = -rDVDAnimatedPosX
		rDVDCol = rndCol()
	end

	if rDVDPosY + dvdLogoSizeY > screen.y then
		rDVDPosY = screen.y - dvdLogoSizeY
		rDVDAnimatedPosY = -rDVDAnimatedPosY
		rDVDCol = rndCol()
	elseif rDVDPosY < 0 then
		rDVDPosY = 0
		rDVDAnimatedPosY = -rDVDAnimatedPosY
		rDVDCol = rndCol()
	end

    dxDrawImage(rDVDPosX, rDVDPosY, dvdLogoSizeX, dvdLogoSizeY, dvdLogo, 0, 0, 0, rDVDCol)
end


function DVD.OnStart ()
	showChat(false)
	showCursor(true)
	addEventHandler('onClientRender',root,DVD.Draw)
end
addEventHandler('onClientResourceStart',root,DVD.OnStart)