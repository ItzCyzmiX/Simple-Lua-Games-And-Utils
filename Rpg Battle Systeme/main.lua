os.execute('cls');

os.execute('title Zerla Land') 

screen = {
    ' ', ' ', ' ', ' ', ' ',
    ' ', ' ', ' ', ' ', ' ',
}

ennAttacks = {
    'Slung Shot',
    'Laser Blast',
    'Tongue Rool',
    'FootFaret',
    'Star Eye',
}

ennemies = {
    'O',
    'X',
    'Z',
}

require('wait');
math.randomseed(os.time())

lvl = 1
exp = 30
Hp = 100
name = ''
onGame = false
enn1HP = 50
enn2HP = 50
enn3HP = 50
enn1 = ' '
exists = false

function loadData()
    local expSave = io.open('expSave.txt', 'r');
    local lvlSave = io.open('lvlSave.txt', 'r');
    local nameSave = io.open('nameSave.txt', 'r');
    if expSave ~= nil then
        exp = expSave:read('n') + 30
        expSave:close();
        exists = true
    end
    if lvlSave ~= nil then
        lvl = lvlSave:read('n');
        lvlSave:close();
        exists = true
    end
    if nameSave ~= nil then
        name = nameSave:read('a');
        nameSave:close();
        exists = true
    end
end

loadData()

if exists == true then
    print("Welcome back " .. name .. " to Zerlu! \n Press Enter To Play");
    io.read()
    onGame = true
else
    io.popen('howtoplay.txt', "r")
    print("Welcome to Zerlu! \n Press Enter To Play");
    io.read();

    print('Enter you hero name');
    name = io.read();

    print('Hi ' .. name .. ' welcome to the battle scene!');
    wait(0.2);
    onGame = true
end

function playerAtt()
    print('Make a move! HP: ' .. Hp ..' EXP: ' .. exp .. ' Level: ' .. lvl);
    att = string.lower(io.read())
    critic = math.random(1, 5)
    local valid = false
    while valid == false do
    if att == "p" then
        if critic == 3 then
            lvl = lvl + 1
            exp = exp + 5
            enn1HP = enn1HP - 10
            print('You attack with punch! ITS A CITICAL HIT! You gained 10 EXP and the ennemy has ' .. enn1HP .. ' HP!');
            valid = true
        else
            enn1HP = enn1HP - 5
            print('You attack with punch! The ennemy has ' .. enn1HP .. ' HP!');
            valid = true
        end
    elseif att == "s" then
            if exp >= 10 then
                if critic == 3 then
                    lvl = lvl + 1
                    exp = exp + 10
                    enn1HP = enn1HP - 30
                    print('You attack with sword! ITS A CITICAL HIT! You gained 10 EXP and the ennemy has ' .. enn1HP .. ' HP!');
                    valid = true
                else
                    exp = exp - 10
                    enn1HP = enn1HP - 10
                    print('You attack with sword! The ennemy has ' .. enn1HP .. ' HP!');
                    valid = true
                end
            else
                print('You Dont Have Enough EXP');
            end
        elseif att == "f" then
            if exp >= 10 then
                if critic == 3 then
                    lvl = lvl + 1
                    exp = exp + 10
                    enn1HP = enn1HP - 40
                    print('You attack with flame! ITS A CITICAL HIT! You gained 10 EXP and the ennemy has ' .. enn1HP .. ' HP!');
                    valid = true
                else
                    exp = exp - 20
                    enn1HP = enn1HP - 20
                    print('You attack with flame! The ennemy has ' .. enn1HP .. ' HP!');
                    valid = true
                end
            else
                print('You Dont Have Enough EXP');
            end
        elseif att == "m" then
            if exp >= 10 then
                if critic == 3 then
                    lvl = lvl + 1
                    exp = exp + 10
                    enn1HP = enn1HP - 80
                    print('You attack with magic! ITS A CITICAL HIT! You gained 10 EXP and the ennemy has ' .. enn1HP .. ' HP!');
                    valid = true
                else
                    exp = exp - 50
                    enn1HP = enn1HP - 40
                    print('You attack with magic! The ennemy has ' .. enn1HP .. ' HP!');
                    valid = true
                end
            else
                print('You Dont Have Enough EXP');
            end
        else
            print('Please enter a valid attack');
            att = io.read()
        end    
    end  
end

function aiAtt()
    print('The ennemy is chosing an attack...')
    wait(0.2)
    local attthing = math.floor(math.random(30, 50))
    Hp = Hp - attthing
    if attthing >= 40 and attthing <= 50 then
        print('The ennemy attacked you with ' .. ennAttacks[math.random(1, 5)] .. ' ITS A CRITICAL HIT! You got ' .. Hp .. ' HP left');
    else
        print('The ennemy attacked you with ' .. ennAttacks[math.random(1, 5)] .. ' ! You got ' .. Hp .. ' HP left');
    end  
end

function checkforDED(obj)
    if obj == 'p' then
        if Hp <= 0 then
            return true
        end
    elseif obj == 'ai' then
        if enn1HP <= 0 then
            return true
        end
    end 
end

function saveData()
    local expSave = io.open('expSave.txt', 'w');
    local lvlSave = io.open('lvlSave.txt', 'w');
    local nameSave = io.open('nameSave.txt', 'w');
    if expSave ~= nil then
        expSave:write(exp);
        expSave:close()
    end
    if lvlSave ~= nil then
        lvlSave:write(lvl);
        lvlSave:close()
    end
    if nameSave ~= nil then
        nameSave:write(name);
        nameSave:close()
    end
end

while onGame do
    playerAtt()
    if checkforDED('ai') then
        lvl = lvl + 1
        print("Congrats You WON! Your level is now " .. lvl);
        onGame = false
        saveData()
        break
    end
    aiAtt()
    if checkforDED('p') then
        if lvl > 0 then
            lvl = lvl - 1
        end
        print("You Died! Your level is now " .. lvl);
        onGame = false
        saveData()
        break
    end
end
