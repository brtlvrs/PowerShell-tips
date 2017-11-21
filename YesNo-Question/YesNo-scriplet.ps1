#-- start a DO-until loop to ask user input and validate the answer
Do {
    #-- ask question with the multiple options added between brackets. Capitalized option is the default option.
    $answer=read-host ("Question with multiple choice options ? [yN]")
    #-- validate answer with regex
    Switch -Regex ($answer) {
        "\A(Y|y)\Z" {
            #-- input is only a y or a Y
            $loopDone=$true #-- we had a valid answer, so exit loop
            write-host "You answered $answer"
            break
        }
        "\A(n|N|)\Z" {
            #-- input is only a n or N or nothing. \A = start of line \Z is end of the line==> \A\Z = nothing returned = empty answer
            write-host "You answered $answer"
            $loopdone=$true #-- we had a valid answer, so exit loop
            break
        }
        default {
            #-- the default action, no valid input
            $loopdone=$false
            write-host "Onbekend antwoord."
        }
    }
   } until ($loopDone)