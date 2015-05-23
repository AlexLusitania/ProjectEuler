#!/usr/bin/python
# -*- coding: utf-8 -*-

# Author : Alexandre Pais Gomes
# Date : 23/05/2015

# Description : If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.

limit = 1000
r = 0
for i in range(limit):
    if((i % 3 == 0) or (i % 5 == 0)):
        r += i
print(r)
