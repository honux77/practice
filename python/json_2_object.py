import json
s = """
{
    "name": "cybaek",
    "detail" : { "last": "baek" },
    "emails": [ "cybaek@xxx.com", "cybaek@yyy.com" ]
}
"""
class JsonObject:
    def __init__(self, d):
        self.__dict__ = d

data = json.loads(s, object_hook=JsonObject) 
print(data.name)
print(data.detail)
print(data.detail.last)
for email in data.emails:
    print(email)
print(data.emails[0])
