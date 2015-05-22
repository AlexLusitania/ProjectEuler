#!/usr/bin/python
# -*- coding: utf-8 -*-

# Author : Alexandre Pais Gomes
# Date : 22/05/2015
# Description : Work out the first ten digits of the one-hundred 50-digits number

x = open("number.txt", "r").read()

r = 0
for i in x.splitlines():
    r = r + int(i)
print(str(r)[:10])
