local clock = os.clock

function wait(n)
    local to = clock()
    while clock() - to <= n do
        
    end
end