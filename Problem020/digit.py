#!/usr/bin/python
# -*- coding: utf-8 -*-

# Author : Alexandre Pais Gomes
# Date : 22/05/2015
# Description : Find the sum of the digits in the number 100!

import math

r = 0
for i in str(math.factorial(100)):
    r = r + int(i)
print(r)
