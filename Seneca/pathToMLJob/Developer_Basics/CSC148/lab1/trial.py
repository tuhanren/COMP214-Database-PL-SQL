dict_temp = {"Jan": None, "Feb": 1}
thisdict = {"brand": "Ford"}
print(thisdict["brand"])
# TEST #
lst = [1, 2, 3]
lst = lst + [4, 5, 6]
print(lst)
lst2 = lst
print(lst)
print(lst2)
lst2.append(lst[:])
print(lst)
print(lst2)