# print dictionary 
import json

goo = {'name': 'honux', 'age': 25, 'favorite' : {'game': 'SF', 'movie': 'matrix', 'book': 'Galaxy hero'}}

print(goo)

print(json.dumps(goo, indent = 4, sort_keys = True))

