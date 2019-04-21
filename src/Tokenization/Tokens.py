def Tokenization(filename):
    assert filename[-3:] == 'lol', "Unsupported File Extension"

    TknsList, eachline = [], []
    token = ''
    strflag = False

    """
    Speacial Symbols to replace prebuild operators.
    ** -> ^
    != -> !
    // -> |
    == -> ~
    <= ≤  # ≤ alt + 243
    >= ≥  # ≥ alt + 242
    """

    specialChar = ['/', '*', '+', '-', '^', '|', '%', '{', '}', '(', ')', '[', ']', '=', '~', '!', '≤', '≥', '<', '>', ':']

    with open(filename, 'r') as grabber:
        lines = grabber.readlines()

    for line in lines:
        if line[0] != "#" and line[0] != '\n':

            for c in line:

                if c == '"':
                    if strflag is False:
                        strflag = True
                        eachline.append('"')
                        if token != '':
                            eachline.append(token)
                            token = ''
                    else:
                        strflag = False
                        eachline.append(token)
                        eachline.append('"')
                        token = ''

                elif strflag is True:
                    token += c

                elif c == ' ':
                    if token != '':
                        eachline.append(token)
                        token = ''

                elif c == ";":
                    eachline.append(token)
                    eachline.append(';')
                    TknsList.append(eachline.copy())
                    token = ''
                    del eachline[:]

                elif c == "#":
                    if token != '':
                        eachline.append(token)
                        # eachline.append(';')
                        TknsList.append(eachline.copy())
                        token = ''
                        del eachline[:]

                elif strflag is False and c in specialChar:
                    if token != '':
                        eachline.append(token)
                    eachline.append(c)
                    token = ''
                elif c == "\n":
                    pass
                else:
                    token += c
    if not (token == '' or token == '\n'):
        eachline.append(token)
        eachline.append(';')
    TknsList.append(eachline.copy())
    del token
    del eachline
    temp = []
    for i in TknsList:
        temp.extend(i)
    return temp


<< << << < HEAD
if __name__ == "__main__":
    tokens = Tokenization("..\\!xobile Samples//file.lol")
    print(tokens)
== == == =
if __name__ == "_main_":
    tokens = Tokenization("..\\First.lol")
    print(tokens)
>>>>>> > 8865ba6ed35fadbda2e5ec0607b278861e0b9938
