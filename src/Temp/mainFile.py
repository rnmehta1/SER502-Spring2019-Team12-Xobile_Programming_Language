from Tokenization import Tokens
import Parser

LinesOfTokens = (Tokens.Tokenization("First.lol"))
for i in LinesOfTokens:
    print(i)

Parser(LinesOfTokens)
