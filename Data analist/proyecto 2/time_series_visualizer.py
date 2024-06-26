import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()

# Import data (Make sure to parse dates. Consider setting index column to 'date'.)
df = pd.read_csv('fcc-forum-pageviews.csv', parse_dates=True, index_col='date')

# Clean data
df = df[(df['value'] >= df['value'].quantile(0.025)) & (df['value'] <=df['value'].quantile(0.975))]


def draw_line_plot():
    # Draw line plot
    fig, ax = plt.subplots(figsize=(32,10))
    ax.plot(df.index, df['value'], color='red')
    ax.set_title('Daily freeCodeCamp Forum Page Views 5/2016-12/2019')
    ax.set_xlabel('Date')
    ax.set_ylabel('Page Views')




    # Save image and return fig (don't change this part)
    fig.savefig('line_plot.png')
    return fig

def draw_bar_plot():
    # Copy and modify data for monthly bar plot
    df_bar = df.copy()

    # Draw bar plot
    df_bar['year']=df_bar.index.year
    df_bar['month']=df_bar.index.month
    df_bar=df_bar.groupby(['year','month']).mean().unstack()
    df_bar.columns = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November','December'] 
    fig= df_bar.plot(kind='bar', figsize=(15,13)).figure
    plt.xlabel('Years')
    plt.ylabel('Average Page Views')
    plt.legend(title='Months')
    plt.xticks(rotation=90)


    # Save image and return fig (don't change this part)
    fig.savefig('bar_plot.png')
    return fig

def draw_box_plot():
    # Prepare data for box plots (this part is done!)
    df_box = df.copy()
    df_box.reset_index(inplace=True)
    df_box['year'] = [d.year for d in df_box.date]
    df_box['month'] = [d.strftime('%b') for d in df_box.date]

    # Draw box plots (using Seaborn)
    fig, (axes1,axes2) = plt.subplots(1,2, figsize=(29,11))
    sns.boxplot(x=df_box['year'], y=df_box['value'], ax=axes1, palette='colorblind')

    axes1.set_title('Year-wise Box Plot (Trend)')
    axes1.set_xlabel('Year')
    axes1.set_ylabel('Page Views')
    axes1.set_ylim(bottom=0, top=200000)
    axes1.set_yticks(range(0,220000,20000))
    #fig, axes = plt.subplots(1,2)
    sns.boxplot(x=df_box['month'], y=df_box['value'] ,ax=axes2,palette='pastel',order=['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'])

    axes2.set_title('Month-wise Box Plot (Seasonality)')
    axes2.set_xlabel('Month')
    axes2.set_ylabel('Page Views')
    axes2.set_ylim(bottom=0, top=200000)
    axes2.set_yticks(range(0,220000,20000))





    # Save image and return fig (don't change this part)
    fig.savefig('box_plot.png')
    return fig
