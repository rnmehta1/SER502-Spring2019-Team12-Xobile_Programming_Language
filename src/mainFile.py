from Tokenization import Tokens
# from Parser import Parser

fileName = str(input("Enter the file fileName: "))
LinesOfTokens = (Tokens.Tokenization(fileName))

with open('{}tokens'.format(fileName[:-3]), 'w') as tokens:
    print(LinesOfTokens, file=tokens, flush=True)

# Parser.Parser(LinesOfTokens)
