from Tokenization import Tokens

vars = ["int", "float", "str", "bool"]


def Parser(lst):
    global vars
    variables = {"int": {}, "float": {}, "str": {}, "bool": {}}
    for l in lst:
        if l[0] in vars:
            val = checkVal(l[0], l[3])
            variables[l[0]][l[1]] = val
        else:
            if l[0] == "PRINT":
                if l[1] in vars:
                    Print(variables[l[1]][l[2]])
                else:
                    Print(l[1][1:-1])

    print(variables)


def Print(Value):
    print(Value)


def checkVal(dataType, Value):
    if dataType == "int":
        return int(Value)
    if dataType == "bool":
        return bool(Value)
    if dataType == "float":
        return float(Value)
    else:
        return str(Value)


if __name__ == "__main__":
    LinesOfTokens = (Tokens.Tokenization("First.lol"))
    Parser(LinesOfTokens)
