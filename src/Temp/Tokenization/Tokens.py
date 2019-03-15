def Tokenization(filename):
    assert filename[-3:] == 'lol', "Unsupported File Extension"

    TknsList, eachline = [], []
    token = ''
    strflag = False

    with open(filename, 'r') as grabber:
        lines = grabber.readlines()
    for line in lines:
        if line[0] != "#" and line[0] != '\n':
            for c in line:

                if c == '"':
                    if strflag is False:
                        strflag = True
                        token = c
                        # print(eachline)
                    else:
                        strflag = False
                        token += c
                        eachline.append(token)
                        # print(token)
                        token = ''
                elif strflag is True:
                    token += c

                # elif c == ',':
                #     pass
                elif c == ' ':
                    # print(TknsList)
                    if token != '':
                        eachline.append(token)
                        token = ''
                    # print(TknsList)
                elif c == "\n":
                    eachline.append(token)
                    eachline.append(';')
                    TknsList.append(eachline.copy())
                    # print(eachline)
                    token = ''
                    del eachline[:]

                else:
                    token += c

    if token != '':
        eachline.append(token)
    eachline.append(';')
    TknsList.append(eachline.copy())
    del token
    del eachline

    return TknsList


if __name__ == "__main__":
    print(Tokenization("..\\First.lol"))
