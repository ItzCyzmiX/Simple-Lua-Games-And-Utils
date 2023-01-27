os.execute('cls')


table = {
    ' ', ' ', ' ',
    ' ', ' ', ' ',
    ' ', ' ', ' ',
}
require('wait');

print('LOADING')

wait(1)
--VARS
math.randomseed(os.time())
curP = 'player'
aiName = ''
winner = 'nobody'
gameIsRunning = false

--Title screen kinda
print("--WELCOME TO TIC TAC TAE-- \n Press Enter To Start");

io.read()
wait(0.1);

print('Choose your name A / B');
name = string.upper(io.read())

while name ~= 'A' or name ~= 'B' and not gameIsRunning do
    if string.upper(name) == 'A' then
        print('You are ' .. name .. ' !');
        gameIsRunning = true
    elseif string.upper(name) == 'B' then
        print('You are ' .. name .. ' !');
        gameIsRunning = true
        break
    else
        print('Please put either A or B');
        name = io.read()
    end
end

if name == 'A' then
    aiName = 'B'
elseif name == 'B' then
    aiName = 'A'
end

function printTable()
    print('\n' .. table[1] .. '|' .. table[2] .. '|' .. table[3]);
    print('______');
    print(table[4] .. '|' .. table[5] .. '|' .. table[6]);
    print('______');
    print(table[7] .. '|' .. table[8] .. '|' .. table[9] .. '\n');
end

function takeInput()
    curP = 'player'
    print('Make a move!');
    move = tonumber(io.read());
    if type(move) == "number" then
        if move <= 9 and move >= 1 and table[move] == ' ' then
        table[move] = name
        curP = 'ai'
        else
            print('Oops that place is full. Try again!');
        end
    else
        print('Please enter a number between 1 and 9!');
    end
end

function aiTurn()
    while curP == 'ai' do
        local rand = math.random(1, #table);
        if table[rand] == ' ' then
            table[rand] = aiName
            curP = 'player'
        end
    end        
end

function checkforWin()
    if table[1] == table[2] and table[1] == table[3] and table[1] ~= ' ' then
        winner = table[1]
        return true
    elseif table[1] == table[4] and table[1] == table[7] and table[1] ~= ' ' then
        winner = table[1]
        return true
    elseif table[1] == table[5] and table[1] == table[9] and table[1] ~= ' ' then
        winner = table[1]
        return true
    end
end

function checkforTie()
    isinTable = 0
    for i = 1, #table do
        if table[i] ~= ' ' then
            isinTable = isinTable + 1
        end
    end
    return isinTable
end

while gameIsRunning do
    printTable()

    takeInput()

    if checkforWin() == true then
        print('\n' .. winner .. " has won!");
        gameIsRunning = false
        break
    end

    if checkforTie() == #table then
        print("\n Its a tie!");
        gameIsRunning = false
        break
    end
    print('Its the ai turn \n');
    wait(0.5)

    aiTurn()

    if checkforWin() == true then
        print('\n' .. winner .. " has won!");
        gameIsRunning = false
        break
    end

    if checkforTie() == #table then
        print("\n Its a tie!");
        gameIsRunning = false
        break
    end
end