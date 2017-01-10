# -*- coding: utf-8 -*-
"""
Created on Wed Oct 14 09:07:42 2015

@author: Sean Violante
"""

import matplotlib.pyplot as plt

import pandas as pd
from IPython.core.debugger import Tracer
df=pd.DataFrame({'a':[1,2,3],'b':[.5,.7,.8],'c':[.3,.2,.1]})


df.a.plot(yerr={'a':df[['b','c']].values})