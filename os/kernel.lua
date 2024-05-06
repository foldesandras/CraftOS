term.clear()
term.setCursorBlink(false)

menuOpened = false
menuLine = 8

function defaultRender()
    term.setCursorPos(1,18)
    print("[Menu]")
    term.setCursorPos(1,1)    
end

defaultRender()

while true do    
    local event, button, x, y = os.pullEvent("mouse_click")
    if x > 0 and x < 7 and y == 18 then
        if menuOpened  ~= true then
            os.run({}, "os/menu.lua")
            menuOpened = true
        else
            term.clear()
            defaultRender()
            menuOpened = false
        end
    elseif x < 11 then
        if y == menuLine + 7 then
            os.shutdown()
        elseif y == menuLine + 1 then
            term.clear()
            defaultRender()
            menuOpened = false
            os.run({}, "os/run.lua")
        elseif y == menuLine + 2 then
            os.run({}, "os/uninstall.lua")
        elseif y == menuLine + 3 then
            term.clear()
            return
        elseif y == menuLine + 6 then
            os.reboot()
        end 
    end
end        
