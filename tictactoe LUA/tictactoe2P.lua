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

local DefineFirst = math.random(1, 2);
if DefineFirst == 1 then
    curP = 'A'
else
    curP = 'B'
end
winner = 'nobody'
gameIsRunning = false

--Title screen kinda
print("--WELCOME TO TIC TAC TAE-- \n Press Enter To Start");

io.read()
wait(0.1);
gameIsRunning = true

function takeInput()
    if curP == 'A' then
        print('Make a move! ' .. curP);
        move = tonumber(io.read());
        if type(move) == "number" then
            if move <= 9 and move >=1  and table[move] == ' ' then
                table[move] = curP
                curP = 'B'
            else
                print('Oops that place is full. Try again!');
            end
        else
            print('Please enter a number between 1 and 9!');
        end    
    elseif curP == 'B' then
        print('Make a move! ' .. curP);
        move = tonumber(io.read());
        if type(move) == "number" then
            if move <= 9 and move >=1  and table[move] == ' ' then
                table[move] = curP
                curP = 'A'
            else
                print('Oops that place is full. Try again!');
            end
        else
            print('Please enter a number between 1 and 9!');
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

function printTable()
    print('\n' .. table[1] .. '|' .. table[2] .. '|' .. table[3]);
    print('______');
    print(table[4] .. '|' .. table[5] .. '|' .. table[6]);
    print('______');
    print(table[7] .. '|' .. table[8] .. '|' .. table[9] .. '\n');
end

while gameIsRunning do
    printTable()

    takeInput()

    if checkforWin() == true then
        print('\n' .. winner .. " has won!");
        gameIsRunning = false
        printTable()
        break
    end

    if checkforTie() == #table then
        print("\nIts a tie!");
        gameIsRunning = false
        printTable()
        break
    end
    printTable()
    wait(0.3)

    takeInput()

    if checkforWin() == true then
        print('\n' .. winner .. " has won!");
        gameIsRunning = false
        printTable()
        break
    end

    if checkforTie() == #table then
        print("\n Its a tie!");
        gameIsRunning = false
        printTable()
        break
    end
end