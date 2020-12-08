util = require("util")

print("Welcome to Hangman!")
Session = {wins = 0, losses = 0}
keepgoing = 1
session = Session
while(keepgoing == 1)
do
    print("Insert a word, the number '1' to select a random word, or the number '0' to quit:")
    word = io.read()
    if word:find(0) then
        keepgoing = 0
        break
            
    elseif not util.hasLetters(word) and not word:find(1) then
        print("Please enter a valid input.\n")

    else
        if word:find(1) then
            word = util.randomWord()
        else
            word = string.lower(word)
        end
        numWrong = 0
        found = {}
        guessed = ""
        for i= 0, word:len() do
            if not util.hasLetters(string.sub(word, i, i)) then
                found[i] = 1
            else
            found[i] = 0
            end
        end

        util.printBoard(word, found, numWrong, "")

        game = true
        while(game) do
            print("Guess a letter:")
            guess = io.read()
            guess = string.lower(string.sub(guess, 0, 1))
            if util.contains(word, guess) then
                for i= 0, string.len(word) do
                    if util.contains(guess, string.sub(word, i , i)) then
                        found[i] = 1
                    end
                end
            elseif(not util.hasLetters(guess)) then
                    
            else
                if(not util.contains(guessed, guess)) then
                    guessed = guessed .. guess
                end
                numWrong = numWrong + 1
            end

            util.printBoard(word, found, numWrong, guessed)

            if(numWrong >= 6) then
                print("Game over! You lost.")
                print("The word was \"" .. word .. "\"")
                 session.losses = session.losses + 1
                game = false
            elseif util.isOver(found) then
                print("Game over! You won!")
                session.wins = session.wins + 1
                game = false
            else
            end
        end
    end
end
print("Session over! You won " .. session.wins .. " game(s) and lost " .. session.losses .. " game(s).")