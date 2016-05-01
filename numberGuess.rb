{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf460
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #---------\
# name: NumberGuess.rb\
#\
#----------------\
 \
class Screen\
 def cls\
   puts ("\\n" * 30)\
   puts "\\a"\
 end\
 \
 def pause\
    STDIN.gets\
 end\
 \
end\
 \
class Game\
    $playedGameCount= 0\
    $numberOfGuesses = 0\
    $totalNumberOfGuesses= 0\
    $avgnumberOfGuesses= 0\
    def display_greeting\
        Console_Screen.cls\
        print "\\t\\t Welcome to the Ruby Number Guessing Game!" +\
        "\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\ Press Enter to " + \
        "continue."\
 \
        Console_Screen.pause\
    end\
 \
    def display_instruction\
        Console_Screen.cls\
        puts "Instruction:\\n\\n"\
 \
        puts "This game randomly generates a number from 1 to 100 and "\
        puts "challaenges you to identify it in as few guesses and possible "\
    end\
 \
    def generate_number\
        return randomNo = 1 + rand(100)\
    end\
 \
    def play_game\
        number = generate_number\
        $playedGameCount = $playedGameCount + 1\
    \
        loop do\
            Console_Screen.cls\
            print "\\nEnter your guess and press the enter key: "\
 \
            reply = STDIN.gets\
            reply.chop!\
            reply = reply.to_i\
 \
            if reply < 1 or reply > 100 then\
                redo # redo the ciurrent iteration of the loop\
            end\
 \
            if reply == number then\
                Console_Screen.cls\
                print "You have guessed the number! Press Enter to continue."\
                Console_Screen.pause\
                $numberOfGuesses = $numberOfGuesses + 1\
                break\
            elsif reply < number then\
                Console_Screen.cls\
                print "Your guess is too low! Press enter to continue."\
                Console_Screen.pause\
            elsif reply > number then\
                Console_Screen.cls\
                print "Your guess is too high! Press enter to continue."\
                Console_Screen.pause\
            end\
            \
            $numberOfGuesses = $numberOfGuesses + 1\
        end\
        $totalNumberOfGuesses = $totalNumberOfGuesses + $numberOfGuesses     \
    end\
 \
    def display_credits\
        Console_Screen.cls\
        puts "\\t\\t\\The total number of game played:: #\{$playedGameCount\}"\
        avgGuessTotal = $totalNumberOfGuesses/$playedGameCount\
        puts "\\t\\t\\Avg number of guess for total game:: #\{avgGuessTotal\}"\
        puts "\\t\\t\\Thanks you for playing the number game!!"\
    end\
 \
    $noRight = 0\
 \
    Console_Screen = Screen.new\
 \
    SQ = Game.new\
 \
    SQ.display_greeting\
 \
    answer = ""\
 \
    loop do\
        Console_Screen.cls\
 \
        print "Are you ready to play the Ruby Number Guessing Game? (y/n): "\
 \
        answer = STDIN.gets\
 \
        answer.chop!\
 \
        break if answer == "y" || answer == "n"\
    end\
 \
    if answer == "n"\
 \
        Console_Screen.cls\
 \
        puts "Perhaps anoher time.\\n\\n"\
 \
    else\
        SQ.display_instruction\
 \
        loop do\
            SQ.play_game\
 \
            Console_Screen.cls\
 \
            print "Would you like to play again? (y/n): "\
 \
            playAgain = STDIN.gets\
            playAgain.chop!\
 \
            break if playAgain == "n"\
        end\
 \
        SQ.display_credits\
 \
    end\
 \
end}