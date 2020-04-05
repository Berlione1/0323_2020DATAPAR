# -*- coding: utf-8 -*-
"""
Created on Fri Apr  3 12:21:32 2020

@author: galic156685
"""

import pandas as pd
import os
Sex=['M','F','Undetermined']
Gender=input('For this study on which gender do you want the analysis (M/F/Undetermined) ? ')
while Gender not in Sex:
    Gender=input('For this study on which gender do you want the analysis (M/F/Undetermined) ? ')

def acquisition():
    shark=pd.read_csv(r'C:\Users\galic156685\0323_2020DATAPAR\Projects\Project_week 2\GSAF5.csv', encoding="cp1252", sep=',')
    return shark

def wrangle(shark):
    global Gender
    df=pd.DataFrame(shark[['Year','Type','Activity','Sex ']])
    df=df.rename(columns={'Sex ':'Sex'})
    df['Activity'].dropna()
    df['Sex'].fillna('Undetermined')
    filtered=(df.Activity.str.contains('Surfing'))&(df.Year>1890)&(df.Type.str.contains('Unprovoked'))&(df.Sex.str.contains(Gender))
    df=df.loc[filtered]
    return df

def analyze(df):
    labels=[i for i in range(1890,2026,10)]
    cutoffs=tuple([i for i in range(1880,2026,10)])
    bins=pd.cut(df.Year, cutoffs,labels=labels)
    df['bins']=pd.cut(df.Year, cutoffs,labels=labels)
    df['Counter']=1
    grouped=df.groupby('bins')['Counter'].agg('sum').reset_index()
    return grouped

def viz(df):
    import matplotlib.pyplot as plt
    import seaborn as sns
    sns.set()
    global Gender
    fig,ax=plt.subplots(figsize=(15,8))
    barchart=sns.barplot(data=df, x='bins', y='Counter')
    plt.title('Evolution of unprovoked shark attacks against surfers for the gender ',Gender)
    return barchart

def save_viz(plot):
    fig=plot.get_figure()
    global Gender
    fig.savefig('Evolution of unprovoked shark attacks against surfers for the gender ',Gender,'.png') 

if __name__=='__main__':
    data=acquisition()
    filtered=wrangle(data)
    results=analyze(filtered)
    barchart=viz(results)
    save_viz(barchart)