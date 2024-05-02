function removeLuaExtensions(s)
  return s:gsub("%.lua", "")
end

for dir in io.popen([[ls -pa ~/.config/nvim/lua/core/ | grep -v /]]):lines() do 
  file_name = removeLuaExtensions(dir)
  if file_name ~= "init" then
    file_path = "core." .. file_name
    require(file_path)
  end
end

