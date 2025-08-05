# Author: Connor Beardsmore <connor.beardsmore@gmail.com>
# Last Modified: 22/09/18

# Change the number after RANDOM to choose which kanji level you want:
# GRADE 1 = 81
# GRADE 2 = 241
# GRADE 3 = 441
# GRADE 4 = 641
# GRADE 5 = 828
# GRADE 6 = 1009
# SECONDARY/ALL = 2139

command:
    " sed -n \"$((RANDOM%81))p\" \"./Daily-Random-Kanji.widget/kanji.txt\" "

# Update is called daily
refreshFrequency: "1d"

# CSS styling
style: """
    top: 580px
    left: 40px
    font-family: Helvetica
    background-color rgba(white, .03)
    padding 16px
    border-radius 8px

    div
        color white
        font-weight: bold
        text-align center
        margin-top: -10px

    #smalltext
        margin-top: 0px
        margin-bottom: -15px
        font-size 12px

    #largetext
        font-size 12px

    #kanji
        font-size 230px
"""

# Initial render
render: (output) ->
    fields = output.split(" ");
    """
    <div id="smalltext"> #{fields[0]} </div>
    <div id="kanji"> #{fields[1]} </div>
    <div id="largetext"> #{fields[2]} </div>
    """

# Update when refresh occurs
update: (output, domEl) ->
    fields = output.split(" ");
    $(domEl).empty();
    $(domEl).append("""
    <div id="smalltext"> #{fields[0]} </div>
    <div id="kanji"> #{fields[1]} </div>
    <div id="largetext"> #{fields[2]} </div>
    """);