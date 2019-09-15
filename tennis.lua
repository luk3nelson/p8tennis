t=0

function _init()
--player bottom
	p={
	sp=1,
	x=52,
	y=112,
	spd=4,
	eng=10
	}
--ball
	b={
	x=64,
	y=64,
	size=3,
	xdir=3,
	ydir=-2
	}
end

function _update()
	moveplayer()
	moveball()
	bounceball()
	bouncepaddle()
	energybar()
end

function _draw()
	cls()
	rectfill(0,0,128,128,3)
	--draw player
	spr(p.sp,p.x,p.y)
	spr(3,p.x+8,p.y)
	rectfill(p.x-1,p.y+9,p.x+p.eng,p.y+9,10)
	rectfill(p.x-6,p.y,p.x+14,p.y+8,10)
	--draw ball
	circfill(b.x,b.y,b.size,15)
	print(p.spd,64,64,4) --player speed output
end

function moveplayer()
	if btn(4) then 
		p.spd = 4
	else p.spd = 2
	end
	if btn(0) then p.x-=p.spd end
	if btn(1) then p.x+=p.spd end
	if btn(2) then p.y-=p.spd end
	if btn(3) then p.y+=p.spd end
end

function moveball()
	b.x+=b.xdir
	b.y+=b.ydir
end

function energybar()
	if btn(4) and p.eng > 0 then
		p.eng -= 1
	else p.eng += 0.5
		if p.eng >= 10 then p.eng = 10 end
	end
end

function bounceball()
	--left
	if b.x<b.size then
		b.xdir=-b.xdir
	end
	--right
	if b.x>128-b.size then
		b.xdir=-b.xdir
	end
	--top
	if b.y<b.size then
		b.ydir=-b.ydir
	end
end

--Bounce paddle against player
function bouncepaddle()
	if b.x>=p.x and
		b.x<=p.x+14 and
		b.y>p.y-8 then
			b.ydir=-b.ydir
	end
end