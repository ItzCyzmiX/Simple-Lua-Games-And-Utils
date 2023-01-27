choices = {
    'r',
    'p',
    's'
}
require('wait');

os.execute('cls');

math.randomseed(os.time());
playerChoice = ''
onPlay = false
winner = ''

print('Welcome to Rock Paper Scisscors! \n Press Enter To Start')

io.read()
onPlay = true

function playerChoose()
    print('Press r for rock, p, for paper, s for scisscors');
    playerChoice = string.lower(io.read())
end

function aiChoose()
    print('The AI is choosing...')
    wait(0.3)
    random = math.random(1, 3);
    aiChoice = choices[random]
end

function checkWinner()
    if playerChoice == aiChoice then
        print('Its a tie!');
        onPlay = false
    elseif playerChoice == 'r' and aiChoice == 'p' then
        print('You lost!');
        onPlay = false
    elseif playerChoice == 'r' and aiChoice == 's' then
        print('You win!');
        onPlay = false
    elseif playerChoice == 's' and aiChoice == 'p' then
        print('You win!');
        onPlay = false
    elseif playerChoice == 's' and aiChoice == 'r' then
        print('You lost!');
        onPlay = false
    elseif playerChoice == 'p' and aiChoice == 's' then
        print('You lost!');
        onPlay = false
    elseif playerChoice == 'p' and aiChoice == 'r' then
        print('You win!');
        onPlay = false
    end
end

while onPlay do
    playerChoose()
    aiChoose()
    checkWinner()
end