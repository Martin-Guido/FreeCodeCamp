import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt


# Import data
df = pd.read_csv('medical_examination.csv')

# Add 'overweight' column
h=df['weight']/(df['height']/100)**2 >25
df['overweight'] = h*1

# Normalize data by making 0 always good and 1 always bad. If the value of 'cholesterol' or 'gluc' is 1, make the value 0. If the value is more than 1, make the value 1.
h= df['gluc']>=1
df['gluc']=h*1
h=df['cholesterol']>1
df['cholesterol']=h*1

# Draw Categorical Plot
def draw_cat_plot():
    # Create DataFrame for cat plot using `pd.melt` using just the values from 'cholesterol', 'gluc', 'smoke', 'alco', 'active', and 'overweight'.
    df_cat = pd.melt(df[['smoke', 'gluc','cholesterol','alco','active','cardio','overweight']],id_vars=['cardio'],value_vars=['active','alco','cholesterol', 'gluc','overweight','smoke'])

    
    # Group and reformat the data to split it by 'cardio'. Show the counts of each feature. You will have to rename one of the columns for the catplot to work correctly.

    

    # Draw the catplot with 'sns.catplot()'



    # Get the figure for the output
    fig = sns.catplot(data=df_cat,x='variable',hue='value', kind='count',col='cardio',estimator='sum')
    fig.set_ylabels('total')
    # Do not modify the next two lines
    fig.savefig('catplot.png')
    return fig


# Draw Heat Map
def draw_heat_map():
    # Clean the data
    df_heat = df.loc[(df['ap_lo'] <= df['ap_hi'])& (df['height'] >= df['height'].quantile(0.025))&(df['height'] <=df['height'].quantile(0.975))&( df['weight'] <= df['weight'].quantile(0.975))&(df['weight'] >=df['weight'].quantile(0.025))]


    # Calculate the correlation matrix
    corr = df_heat.corr()
    
    # Generate a mask for the upper triangle
    mask = np.triu(np.ones_like(corr, dtype=bool))



    # Set up the matplotlib figure
    fig, ax = plt.subplots(figsize=(11, 9))
    sns.heatmap(corr, mask=mask, center=0, annot=True,fmt='.1f',
            square=True, linewidths=.5,cbar_kws={"shrink":0.5, 
            "ticks":[-0.08,0,0.08,0.16,0.24]},vmax=.32,vmin=-.16)


    # Draw the heatmap with 'sns.heatmap()'



    # Do not modify the next two lines
    fig.savefig('heatmap.png')
    return fig