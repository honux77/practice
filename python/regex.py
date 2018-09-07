import re

# simple code to extract serial from xml 
# use regex and findall method

with open('keys.txt') as fp:
    data = fp.read()
    p = re.compile(r'\w{5}-\w{5}-\w{5}-\w{5}-\w{5}')
    keys = p.findall(data)    

with open('newkey.csv', 'w') as fp:
    fp.writelines('win7pro-key\n')
    for key in keys:
        fp.write(key +'\n')

