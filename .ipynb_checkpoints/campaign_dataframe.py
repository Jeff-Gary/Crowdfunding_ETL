import pandas as pd
import datetime

df = pd.read_excel(r'..\Crowdfunding_ETL\crowdfunding.xlsx')

# 1. Extract the required columns and rename where necessary
campaign_df = df[['cf_id', 'contact_id', 'company_name', 'blurb', 'goal', 'pledged', 
                           'outcome', 'backers_count', 'country', 'currency', 'launched_at', 
                           'deadline', 'category & sub-category']] 

# 2. Rename columns as specified
campaign_df = campaign_df.rename(columns={
    'blurb': 'description',
    'launched_at': 'launch_date',
    'deadline': 'end_date'
})

# 3. Convert 'goal' and 'pledged' columns to float
campaign_df['goal'] = campaign_df['goal'].astype(float)
campaign_df['pledged'] = campaign_df['pledged'].astype(float)

# 4. Convert 'launch_date' and 'end_date' to datetime format
campaign_df['launch_date'] = pd.to_datetime(campaign_df['launch_date'], utc=True)
campaign_df['end_date'] = pd.to_datetime(campaign_df['end_date'], utc=True)

# 5. Extract the category_id and subcategory_id from the 'category_subcategory' column
# Assuming the 'category & sub-category' column contains a combination of category and subcategory
campaign_df[['category_id', 'subcategory_id']] = campaign_df['category & sub-category'].str.split('/', expand=True)

campaign_df = campaign_df[['cf_id','contact_id','company_name','description','goal','pledged','outcome',
                           'backers_count','country','currency','launch_date','end_date','category_id','subcategory_id']]




campaign_df.to_csv('campaign.csv',index=False)