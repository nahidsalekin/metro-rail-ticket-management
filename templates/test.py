import re
n= []
data = "4 (B-7,A-0,B-25,B-0)"
print(re.findall('\d+', data))
n = re.findall('\d+', data)
n.pop(0)
for i in n:
    print(i)
