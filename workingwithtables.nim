# Copyright 2019.
import tables

var a = {"hi":1, "there":2}.toTable
echo a["hi"], " ", a.len
echo "a is of type ", $type(a)
assert a.hasKey("hi")

for key, value in a:
  echo key, " ", value


var
  hash = initTable[string, int]() # empty hash table
  hash2 = {"key1": 1, "key2": 2}.toTable # hash table with two keys
  hash3 = [("key1", 1), ("key2", 2)].toTable # hash table from tuple array
  hash4 = @[("key1", 1), ("key2", 2)].toTable # hash table from tuple seq
  value = hash2["key1"]


hash["spam"] = 1
hash["eggs"] = 2
hash.add("foo", 3)

echo "hash has ", hash.len, "elements"
echo "hash has key foo? ", hash.hasKey("foo")
echo "hash has key bar? ", hash.hasKey("bar")

echo "iterate pairs: " # iterate over (key, value) pair
for key, value in hash:
  echo key, ": ", value

echo "iterate keys: " #iterate over keys
for key in hash.keys:
  echo key

echo "iterate values: " # iterate over values
for key in hash.values:
  echo key

# getting values of specific keys
echo """hash["spam"] = """, hash["spam"]

# if you try to get a value for an unset key, you will get
# keyerro exception

try:
  echo """hash["key_not_yet_set"] = """, hash["key_not_yet_set"]
except KeyError:
  echo """hash["key_not_yet_set"] is not yet set"""
