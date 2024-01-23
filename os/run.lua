function endsWith(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end

term.setCursorPos(1, 13)
print("-----Run-----")
print("|           |")
print("-------------")

term.setCursorPos(3, 14)
file = read()
term.clear()

if not endsWith(file, ".lua") then
    file = file .. ".lua"
end

if fs.exists(file) then
    os.run({}, file)
elseif fs.exists("rom/programs/" .. file) then
    os.run({}, "rom/programs/" .. file)
end
