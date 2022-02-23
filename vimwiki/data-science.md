# Data Science

## Tips and Tricks

1) If at any point you have issues, you can trigger intelisence by pressing tab in the jupyter notebook
2) If you need to see the documentation for a particular function you can press 'shift + tab' and it will trigger the documentation for the particular function in jupyter notebooks.
3) You can pull only specific columns from a data-frame by calling the df with nested square braces where the inner square braces contain the names of the columns
4) you can see a small sample of the data by calling df.head(). You can see data of a bigger size by calling df.sample() and passing an integer as the first argument. Sample also takes an argument named random_state which is a number. This makes it so that if you run the cell again you will be presented with the same 'random data as the previous run.' useful for debugging

**Example 3:**

``` python
df[['column1', 'column2']]
```

**Example 4:**

``` python
df.sample(100, random_state=1)
```

## Pandas

Pandas is the library of choice for data analysis. It is basically like a spreadsheet. The main form of working in pandas is with a 'data-frame', you can use this object to manipulate data. Importing pandas is easy, you can do it like so:

``` python
import pandas as pd	
```

where pd is the variable that you will use to refer to pandas

## Opening files

After importing pandas, one of the very first things we are going to want to do is to import a file. You can do this in many different ways one of the easiest ways to do this is by csv. You can do this like so:

``` python
df = pd.read_csv('path/to/file.csv')
```

### Tricks for opening files

Sometimes you will want to open files that are online, you can reach for them by passing the url to the file in as the first argument.

### Options

1) you can pass the delimiter to the read_csv function by using the sep argument,
1) you can change the types of the columns by using the dtype argument

**Example:**

``` python
pd.read_csv('path/to/file.tsv', sep='\t', dtype={'column_name': 'category'})
```


## Putting Data Together

there are many different ways to put data together, here are a few useful ways. For methods that combine in an inclusive way (meaning that it is joined with an 'outer' style), NaNs are provided for missing data

### Join

You can use the join function (df.join()) by by passing another data-frame as the argument to this function


### Merge

The merge function is a bit more complicated, but more useful for merging complex data. It consists of a left data-frame and a right data-frame, and a column to merge on. There are a few different ways to go about merging the data. 

1) left - all the data in the left data-frame will be kept, and the data in common in the right will be merged in.
1) right - all the data in the right data-frame will be kept, and the data in common in the left will be merged in.
1) outer - all the data in the left and right data-frames will be kept, this may result in a-lot of data being undefined.
1) inner - only the data in common in the left and right data-frames will be kept.

**Example:**
In this example we are going to merge the data with the 'inner' parameter (default). We are also going to merge it on the 'latitude' column. df_geo and df_price both represent slices of a dataset that has been split into two subsets.

``` python
df_geo.merge(df_price, left_on='latitude', right_on='latitude')
```

### Concatenate

You can use the concat function to concatenate data-frames together. This function has a required parameter of 'axis' this is just what axis you want to add the data frames together on. 0 = x, 1 = y

**Example:**
``` python
pd.concat([df_geo, df_price], axis=1)
```

## Data Cleaning 

One of the most important parts of data science is cleaning your data. If you don't clean it you will get bad results. We spend a-lot of time looking for missing values, outliers etc.. these can affect results. Missing data can be more informative than the data itself.


### Missing number

Is a library for visualizing missing values in python.
