#!/usr/bin/python
# -*- coding: utf-8 -*-

# Author : Alexandre Pais Gomes
# Date : 23/05/2015

# Description : If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.

limit = 999

def sum_divisible_by(n):
    p = limit // n
    return n*(p*(p+1)) // 2

print(sum_divisible_by(3) + sum_divisible_by(5) - sum_divisible_by(15))
