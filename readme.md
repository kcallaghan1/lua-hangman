This program is a hangman game that allows you to play against another person or the computer (by selecting from a random list of words.)

This program is written in Lua, a scripting language that can be compiled with an ANSI C or C++ compiler. The langauge package can be downloaded directly from the Lua website:
https://www.lua.org/download.html where there are instructions on how to install it. Alternatively, you can download the binary here: http://luabinaries.sourceforge.net/download.html.
It is important to remember to add the folder containing Lua to your system's environment path variable.
From there, runnning this program is as simple as executing "lua54 hangman.lua" from the command prompt.

Lua is a very simple language to learn and there are very comprehensive tutorials online for anything you could want to do. Conveniently, Lua hosts an online instructional textbook written
by the langauge's own chief architect directly on their own website: https://www.lua.org/pil/contents.html.

I did not feel that this project or the language itself is too challenging. The most jarring thing about Lua compared to the other programming languages I've used is that all data structures essentially boiled down to one structure called a table. Tables are Lua's substitute for arrays, lists, structs, and even classes. Some syntax is also a little confusing: for example if you have a string str and you want to see if it matches the string "test", common practice for me in other languages would be a call that looks like this:
str.match("test");
However, in Lua, you actually need to call it on the string library itself, passing str as a parameter:
string.match(str, "test");
Alternatively, you could do something resembling the first call with a modified syntax:
str:match("test");
The above example and the fact that for loops are inclusive to the defined-boundaries (unlike any other language I have used before), were the most significant challenges of this language. That is to say, it is not a very difficult language.

And therein lies the benefit of this language: it is so simple. The syntax is easy (albeit unfamiliar), there aren't any complicated data structures to remember, and everything is pretty self-contained with little reliance on external or default libraries. It is also my understanding that implementing a Lua script into a C program is also fairly easy as that is essentially what the language was designed to do. Lua is a simple but powerful language and I think it could easily hold its own against Python as the de-facto "first language that should be taught."