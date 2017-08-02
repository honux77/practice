string = input().strip()

count = 0
for char in string:
    if "A" <= char <= "Z":
        count += 1

print(count + 1)
