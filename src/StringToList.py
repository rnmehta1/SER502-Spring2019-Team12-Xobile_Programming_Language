lst = """['int', 'abc', '=', '5', ';', 'int', 'check', '=', '10', ';', 'float', 'y', '=', '10', ';', 'bool', 'first', '=', 'True', ';', 'bool', 'second', '=', 'False', ';', 'PRINT', '"', 'hello world', '"', ';', 'PRINT', 'int', 'abc', ';', 'while', '1:', ';', 'pass', ';', 'var', '~', 'var2', ';', 'PRINT', '"', 'check', '"', ';']"""

realList = []
temp = ''
commaFlag = False
doubleComma = False
for i in range(1, len(lst) - 1):
    if (lst[i] == '\''):
        if doubleComma is True:
            doubleComma = False
        else:
            doubleComma = True
    elif lst[i] != ',' and doubleComma is True:
        temp += lst[i]
    elif lst[i] == ',' and doubleComma is False:
        if temp:
            realList.append(str(temp))
            temp = ''
    elif lst[i] != "'" and lst[i] != ' ':
        temp += lst[i]
if temp:
    realList.append(temp)
new = ['int', 'abc', '=', '5', ';', 'int', 'check', '=', '10', ';', 'float', 'y', '=', '10', ';', 'bool', 'first', '=', 'True', ';', 'bool', 'second', '=', 'False', ';', 'PRINT', '"', 'hello world', '"', ';', 'PRINT', 'int', 'abc', ';', 'while', '1:', ';', 'pass', ';', 'var', '~', 'var2', ';', 'PRINT', '"', 'check', '"', ';']

print(realList == new)

temp = ''
for i in new:
    temp += i + ','
print(temp)
