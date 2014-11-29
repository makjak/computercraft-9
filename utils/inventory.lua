function transfer(array)
  for i,v in ipairs(array) do
    if not(turtle.transferTo(v,1)) then
      turtle.select(2)
      turtle.transferTo(v,1)
    end
  end
  turtle.select(1)
end

function sort(debug,count,i)
  i = i or 2
  count = count or turtle.getItemCount(1)
  if turtle.transferTo(i,count) then
    turtle.select(1)
    if debug then print("sorted") end
    return true
  else
    if i == 16 then
      print "Inventory Full"
      return false
    else
      if debug then print("not the right block, moving on") end
      return sort(debug,count, i+1)
    end
  end
end
