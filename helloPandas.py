# -*- coding: utf-8 -*-
"""
Created on Tue Sep 13 16:01:14 2016

@author: richasdy
"""
import pandas as pd
import numpy as np

from sklearn import datasets
content = dir(datasets)
print(content)

# data is series
s = pd.Series(np.random.randn(5), index=['a', 'b', 'c', 'd', 'e'])
t = pd.Series(np.random.randn(5))
print(s)
print(t)

print(s.index)
print(t.index)

# data is dictionary
d = {'a' : 0., 'b' : 1., 'c' : 2.}
print(pd.Series(d))
print(pd.Series(d, index=['b', 'c', 'd', 'a']))

# data is scalar
print(pd.Series(5., index=['a', 'b', 'c', 'd', 'e']))

# acessing series
# ndarray like
print(s)
print(s[0])
print(s[:3])
print(s[s > s.median()])
print(s[[4, 3, 1]])
print(np.exp(s))

# dictionary like
print(s['a'])
print(s['e'])
s['e'] = 12.
print(s)
print('e' in s)
print('f' in s)
#print(s['f'])  # error
print(s.get('f'))
print(s.get('f', np.nan))


# vector operation
print(s + s)
print(s * 2)
print(np.exp(s))
print(s[1:] + s[:-1])


s = pd.Series(np.random.randn(5), name='something')
print(s)
print(s.name)
s2=s.rename("different")
print(s2.name)


# DataFrame
# From dict of Series or dicts
d = {'one' : pd.Series([1., 2., 3.], index=['a', 'b', 'c']),
     'two' : pd.Series([1., 2., 3., 4.], index=['a', 'b', 'c', 'd'])}
df = pd.DataFrame(d)
print(df)
print(pd.DataFrame(d, index=['d', 'b', 'a']))
print(pd.DataFrame(d, index=['d', 'b', 'a'], columns=['two', 'three']))
print(df.index)
print(df.columns)

# From dict of ndarrays / lists
d = {'one' : [1., 2., 3., 4.],
     'two' : [4., 3., 2., 1.]}
df2 = pd.DataFrame(d)
print(df2)
print(pd.DataFrame(d, index=['a', 'b', 'c', 'd']))

# From structured or record array
data = np.zeros((2,), dtype=[('A', 'i4'),('B', 'f4'),('C', 'a10')])
data[:] = [(1,2.,'Hello'), (2,3.,"World")]
df3 = pd.DataFrame(data)
print(df3)
print(pd.DataFrame(data, index=['first', 'second']))
print(pd.DataFrame(data, columns=['C', 'A', 'B']))

# From a list of dicts
data2 = [{'a': 1, 'b': 2}, {'a': 5, 'b': 10, 'c': 20}]
df3 = pd.DataFrame(data2)
print(df3)
print(pd.DataFrame(data2, index=['first', 'second']))
print(pd.DataFrame(data2, columns=['a', 'b']))

# From a dict of tuples
dtuples = {('a', 'b'): {('A', 'B'): 1, ('A', 'C'): 2},
           ('a', 'a'): {('A', 'C'): 3, ('A', 'B'): 4},
           ('a', 'c'): {('A', 'B'): 5, ('A', 'C'): 6},
           ('b', 'a'): {('A', 'C'): 7, ('A', 'B'): 8},
           ('b', 'b'): {('A', 'D'): 9, ('A', 'B'): 10}}
df4 = pd.DataFrame(dtuples)
print(df4)

# alternate contructor
df5 = pd.DataFrame.from_records(data, index='C')
print(df5)

print(pd.DataFrame.from_items([('A', [1, 2, 3]), ('B', [4, 5, 6])]))

print(pd.DataFrame.from_items([('A', [1, 2, 3]), ('B', [4, 5, 6])],
                         orient='index', columns=['one', 'two', 'three']))
                         
                         
# accesing
print(df['one'])
df['three'] = df['one'] * df['two']
print(df)
df['flag'] = df['one'] > 2
print(df)
del df['two']
print(df)
three = df.pop('three')
print(df)
df['three']=three
print(df)
df['foo'] = 'bar'
print(df)
df['one_trunc'] = df['one'][:2]
print(df)                        
df.insert(1, 'bar', df['one'])
print(df)
print(df['one']) # Select column, o=Series
print(df.loc['a']) # Select row by label, o=Series
print(df.iloc[1]) # Select row by integer location, o=Series
print(df[5:10]) # Slice rows, o=DataFrame
#print(df[bool_vec]) # Select rows by boolean vector, o=DataFrame

# iris = diabetes data
iris = pd.read_csv('iris.data')
print(iris.head())
print((iris.assign(sepal_ratio = iris['SepalWidth'] / iris['SepalLength']).head()))
print(iris.assign(sepal_ratio = lambda x: (x['SepalWidth'] / x['SepalLength'])).head())
#(iris.query('SepalLength > 5')
#      .assign(SepalRatio = lambda x: x.SepalWidth / x.SepalLength,
#              PetalRatio = lambda x: x.PetalWidth / x.PetalLength)
#      .plot(kind='scatter', x='SepalRatio', y='PetalRatio'))



# data alightment and arithmetics
df = pd.DataFrame(np.random.randn(10, 4), columns=['A', 'B', 'C', 'D'])
df2 = pd.DataFrame(np.random.randn(7, 3), columns=['A', 'B', 'C'])
print(df + df2)
print(df - df.iloc[0])


index = pd.date_range('1/1/2000', periods=8)
df = pd.DataFrame(np.random.randn(8, 3), index=index, columns=list('ABC'))
print(df)
print(type(df['A']))
print(df - df['A'])
print(df * 5 + 2)
print(1 / df)
print(df ** 4)

df1 = pd.DataFrame({'a' : [1, 0, 1], 'b' : [0, 1, 1] }, dtype=bool)
df2 = pd.DataFrame({'a' : [0, 1, 1], 'b' : [1, 1, 0] }, dtype=bool)
print(df1 & df2)
print(df1 | df2)
print(df1 ^ df2)
print(-df1)

#transpose
print(df[:5].T)



# DataFrame interoperability with NumPy functions
print(np.exp(df))
print(np.asarray(df))
print(df.T.dot(df))
s1 = pd.Series(np.arange(5,10))
print(s1.dot(s1))


# console display
baseball = pd.read_csv('baseball.csv')
print(baseball)
print(baseball.info())
print(baseball.iloc[-20:, :12].to_string())

print(pd.DataFrame(np.random.randn(3, 12)))
#pd.set_option('display.width', 40) # setting the display.width option. default is 80




datafile={'filename': ['filename_01','filename_02'],
           'path': ["media/user_name/storage/folder_01/filename_01",
                    "media/user_name/storage/folder_02/filename_02"]} 
#pd.set_option('display.max_colwidth',30)
print(pd.DataFrame(datafile))
#pd.set_option('display.max_colwidth',100)
print(pd.DataFrame(datafile))



# DataFrame column attribute access and IPython completion
df = pd.DataFrame({'foo1' : np.random.randn(5),
                   'foo2' : np.random.randn(5)})
print(df)
print(df.foo1)



# Panel
wp = pd.Panel(np.random.randn(2, 5, 4), items=['Item1', 'Item2'],
               major_axis=pd.date_range('1/1/2000', periods=5),
               minor_axis=['A', 'B', 'C', 'D'])
#print(wp)

# From dict of DataFrame objects
data = {'Item1' : pd.DataFrame(np.random.randn(4, 3)),
        'Item2' : pd.DataFrame(np.random.randn(4, 2))}
print(pd.Panel(data))
