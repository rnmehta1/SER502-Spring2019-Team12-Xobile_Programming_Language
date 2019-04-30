from Tokenization import Tokens
# from Parser import Parser

fileName = str(input("Enter the file fileName: "))
LinesOfTokens = (Tokens.Tokenization("!xobile Samples//{}".format(fileName)))
# print(LinesOfTokens)


with open('!xobile Samples//{}tokens'.format(fileName[:-3]), 'w') as tokens:
    print(LinesOfTokens, file=tokens, flush=True)
print(LinesOfTokens)

with open('!xobile Samples//{}tokenstreams'.format(fileName[:-3]), 'w') as tokens:
    for i in LinesOfTokens:
        print(i, file=tokens, flush=True)


# Parser.Parser(LinesOfTokens)
