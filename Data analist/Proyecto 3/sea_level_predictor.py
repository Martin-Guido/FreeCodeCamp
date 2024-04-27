import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import linregress

def draw_plot():
    # Read data from file
    df = pd.read_csv('epa-sea-level.csv', dtype={'Year': np.int64, 'CSIRO Adjusted Sea Level': np.float64})
    
    # Create scatter plot
    plt.scatter(df['Year'], df['CSIRO Adjusted Sea Level'],marker="x",c='k',s=3)
  
    # Create first line of best fig
    m, b, r, p, se = linregress(df['Year'], df['CSIRO Adjusted Sea Level'])
    x = pd.Series([ i for i in range(1880,2051)])
    y = m*x + b
    plt.plot(x,y,'r')
    

    # Create second line of best fit
    df_2 = df[df['Year'] >= 2000]
    m, b, r, p, se = linregress(df_2['Year'], df_2['CSIRO Adjusted Sea Level'])
    x = pd.Series([ i for i in range(2000,2051)])
    y = m*x + b
    plt.plot(x,y,'b')
    

    # Add labels and title
    plt.title('Rise in Sea Level')
    plt.xlabel('Year')
    plt.ylabel('Sea Level (inches)')
    
    
    
    # Save plot and return data for testing (DO NOT MODIFY)
    plt.savefig('sea_level_plot.png')
    return plt.gca()