# TODO: use dict to construct hash table
items = dict({"key1": 1 , "key2" : 2, "key3": "three" })
print(items)
# add item 
items["key4"] = 4
print(items)

# replace 
items["key1"] = "One"
print(items)

# TODO: iterate use .items() function
for key, value in items.items():
    print(f"Key: {key}, Value: {value}.")