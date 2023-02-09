
local points = {}
local COUNT = 1000
local H = 400
local W = 400

local colors = {
    {0xbf,0,255},
    {0xa1,0,0xe2},
    {0x82,0,0xc5},
    {0xdd,0xa0,0xdd},
    {255,255,255}
}

function newspeed()
    return love.math.noise(love.math.random())*100
end

function love.load()
    local choice = love.math.random(1,#colors)
    for i=1,COUNT do
        table.insert(points, {
            x=love.math.random(1,W),
            y=love.math.random(1,H)*-1,
            speed=newspeed(),
            color=colors[choice]
        })
    end
end

function love.update(dt)
    for _,v in pairs(points) do
        v.y = v.y + v.speed*dt
        if v.y>H then
            v.y = -1 * love.math.random(1,100)
            v.speed = newspeed()
        end
    end
end

function love.draw()
    for _,v in pairs(points) do
        love.graphics.setColor(
            love.math.colorFromBytes(v.color[1],
                v.color[2], v.color[3])
        )
        love.graphics.points(v.x,v.y)
    end
end