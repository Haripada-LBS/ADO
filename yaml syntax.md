---
# Comments inside a YAML file can be added followed by the '#' character

# Scalars (strings/numbers/booleans)   
name: 'Modern Math'     # string  
author: Ram             # string      
publisher: "ABC"        # string  
edition: 2              # integer              
price: 10.50            # float                    
textbook: true          # boolean type 
date: 2015-04-05        # date type

# Sequences are (arrays/lists) with each item starting with a hyphen (-). Lists can also be nested.
books:
  - Math
  - Physics
  - Chemestry
    
# Store list of books (objects) Sequence of Mappings
  librery:
  - name: "Math"
    author: Raj 
    price: 100
  - name: "Physics"
    author: Ram
    price: 150
  - name: "Chemestry"
    author: Jon
    price: 200


# Mapping (dictionaries/objects)
docker:
    - image: ubuntu:14.04
    - image: mongo:2.6.8
      command: [mongod, --smallfiles]
    - image: postgres:9.4.1

# dictionary are written like "key: value"
name: Martin D'vloper
languages:
  perl: Elite
  python: Elite
  pascal: Lame

# Literals — Strings
message1: YAML & JSON 
message2: "YAML & JSON" 

# Folding Strings

message: >
 even though
 it looks like
 this is a multiline message,
 it is actually not

# The above YAML snippet is interpreted as below.
message: "even though it looks like this is a multiline message,it is actually not"

# Block strings
message: |
 this is
 a real multiline
 message

# This is interpreted with the new lines (\n) as below.
message: this is
 a real multiline
 message