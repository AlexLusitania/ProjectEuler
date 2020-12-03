#!/usr/bin/python
# -*- coding: utf-8 -*-

# Author : Alexandre Pais Gomes
# Date : 22/05/2015

# Description : 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 21000?

import math

n = str(pow(2,1000))
r = 0
for i in n:
    r += int(i)
print(r)
