from Tokenization import Tokens

fileName = str(input("Enter the file fileName: "))
LinesOfTokens = (Tokens.Tokenization("!xobile Samples//{}".format(fileName)))
# print(LinesOfTokens)


# with open('!xobile Samples//{}tokens'.format(fileName[:-3]), 'w') as tokens:
#     print(LinesOfTokens, file=tokens, flush=True)

with open('!xobile Samples//{}tokenstreams'.format(fileName[:-3]), 'w') as tokens:
    for i in LinesOfTokens:
        print(i, file=tokens, flush=True)

with open('!xobile Samples//{}tokenstreams'.format(fileName[:-3]), 'r') as grabber:
    lines = grabber.read()

temp = '['
for i in range(len(lines)):
    if lines[i] != '\n':
        temp += lines[i]
    else:
        if i != len(lines) - 1:
            temp += ', '
temp += '].'

with open('!xobile Samples//{}tokens'.format(fileName[:-3]), 'w') as tokens:
    print(temp, file=tokens, flush=True)
