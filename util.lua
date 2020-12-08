local util = {}

-- Returns true if word is an alphabetic character (upper or lowercase) and false otherwise.
function util.hasLetters(word)
    return string.find(word, "%a") and true
end


-- Shorthand function to bypass lua syntax
function util.contains(bigWord, smallWord)
    return string.match(bigWord, smallWord) and true
end


-- Returns a random word from the word bank.
function util.randomWord()
    file = io.open("wordbank.txt", "r")
    num = math.random(1, 1000)
    word = ""
    for i = 1, 1000 do
        if(i == num) then
            word = file:read()
        else
            file:read()
        end
    end
    file:close()
    return word
end



-- Prints the current state of the game - hangman, remaining puzzle, and previously incorrectly guessed letters.
function util.printBoard(word, found, numWrong, guessed)
    print("  +---+\n  |   |")
    if(numWrong >= 1) then
        print("  O   |")
    else
        print("      |")
    end
    if(numWrong == 2) then
        print("  |   |")
    elseif(numWrong == 3) then
        print(" /|   |")
    elseif(numWrong >= 4) then
        print(" /|\\  |")
    else
        print("      |")
    end
    if(numWrong == 5) then
        print(" /    |")
    elseif(numWrong >= 6) then
        print(" / \\  |")
    else
        print("      |")
    end
    print("      |\n=========\n")

    wordOutput = ""
    for i=1, string.len(word) do
        if(found[i] == 1 or not util.hasLetters(string.sub(word, i, i))) then
            wordOutput = wordOutput .. word:sub(i, i) .. " "
        else
            wordOutput = wordOutput .. "_ "
        end
    end
    print(wordOutput)

    print("Guessed: " .. guessed)
end


-- Determines whether the puzzle has been solved or not.
function util.isOver(found)
    for i=0, #found do
        if found[i] == 0 then
            return false
        end
    end
    return true
end

return util