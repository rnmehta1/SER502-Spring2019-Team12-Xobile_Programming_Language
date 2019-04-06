def dircheck(r):
    count = 1
    for i in dir(r):
        if count % 3 == 0:
            print("{}".format(i))
        else:
            print("{0:20}".format(i), end='\t')
        count += 1
