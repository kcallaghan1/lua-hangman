package.path = "./?.lua;" .. package.path
local util = require("util")

function compareIsTrue(val)
    return val and true
end

function compareIsFalse(val)
    return not val and not val
end





function test_hasLetters()
    results = {}
    results[0] = compareIsTrue(util.hasLetters("letters"))
    results[1] = compareIsTrue(util.hasLetters("LETTERS"))
    results[2] = compareIsTrue(util.hasLetters("lEtTeRs"))
    results[3] = compareIsFalse(util.hasLetters(12345))
    results[4] = compareIsFalse(util.hasLetters("12345"))
    results[5] = compareIsTrue(util.hasLetters("Test 123"))
    results[6] = compareIsFalse(util.hasLetters("-/$^#"))
    results[7] = compareIsTrue(util.hasLetters("-/$^#f"))

    for i=0, 7 do
        if results[i] == false then
            return false
        end
    end
    return true
end


function test_contains()
    results = {}
    word = "The Ecstacy of Gold"
    results[0] = compareIsTrue(util.contains(word, "Gold"))
    results[1] = compareIsTrue(util.contains(word, "stacy"))
    results[2] = compareIsFalse(util.contains(word, "zzz"))
    results[3] = compareIsTrue(util.contains(word, ""))
    results[4] = compareIsTrue(util.contains(word, "he "))

    for i= 0, 4 do
        if(results[i] == false) then
            return false
        end
    end
    return true
end


function test_randomWord()
    for i = 0, 15 do
        print(util.randomWord())
    end
end






print("Testing hasLetters():")
if test_hasLetters() then
    print("PASSED")
else
    print("FAILED")
end
print("Testing contains():")
if test_contains() then
    print("PASSED")
else
    print("FAILED")
end
print("Testing randomWord():")
test_randomWord()