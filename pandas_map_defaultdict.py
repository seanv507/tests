# -*- coding: utf-8 -*-
"""
Created on Tue Jan 26 12:20:46 2016

@author: Sean Violante
"""

import collections
import pandas as pd

a=pd.Series([1,2,3])
print 'a = '
print a

c=collections.defaultdict(int)

c[1]=1
c[2]=4
b=a.map(c)
print 'b = '
print  b
# b.iloc[2] set to Nan (ignoring defaultdict)

d=a.map(lambda x : c[x])
print 'd = '
print d
# d.iloc[2] set to 0 (desired default value)
pd.show_versions()

