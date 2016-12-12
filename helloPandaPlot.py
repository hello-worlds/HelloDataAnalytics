# -*- coding: utf-8 -*-
"""
Created on Mon Sep 19 06:52:47 2016

@author: richasdy
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
plt.style.use('ggplot')

# plotting
ts = pd.Series(np.random.randn(1000), index=pd.date_range('1/1/2000', periods=1000))
ts = ts.cumsum()
ts.plot()

df = pd.DataFrame(np.random.randn(1000, 4), index=ts.index, columns=list('ABCD'))
df = df.cumsum()
plt.figure()
df.plot()
