chars = {
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 1 , 2, 3, 4, 5, 6, 7, 8, 9, 0, '@' 
}
os.execute('cls');

function generatePass(intensity)
    pass = ''
    for i = 1 , intensity do
        pass = pass .. chars[math.random(1, #chars)]
    end
    return pass
end

print('Enter the length of the password');

inst = io.read();

local passES = io.open('pass.txt', 'w+');
passES:write(generatePass(inst) .. '\r \n');
passES:close()

print('Your password is ' .. pass);