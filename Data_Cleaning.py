import pandas as pd
import numpy as np

df = pd.read_csv('data/layoffs.csv')

# print(df["company"].str.len().max())
# print(df["location"].str.len().max())
# print(df["industry"].str.len().max())

#print(df.shape)

#print(df.info())

#print(df.describe())

#print(df.isnull().sum())

#print(df["funds_raised"])

#missing_per_and_total = df[df["total_laid_off"].isnull() & df["percentage_laid_off"].isnull()]

#print(missing_per_and_total.shape)
#print("_________________________________")
#print(missing_per_and_total.head())
#print("_________________________________")

# """Start Here"""

print("_________________________________")

df = df.drop(columns=["source", "funds_raised", "date_added", "stage"])
print("Dropped Source, funds raised, date added, and stage")

print("_________________________________")

df = df.dropna(subset=["total_laid_off", "percentage_laid_off"], how="all")
print("dropped all rows where total laid off and percentage laid off were null")

print("_________________________________")

df["date"] = pd.to_datetime(df["date"], format="%m/%d/%Y")
print("Changed date to datetime")

print("_________________________________")

df.loc[df["company"] == "Eyeo", "industry"] = "Marketing"
df.loc[df["company"] == "Appsmith", "industry"] = "Infrastructure"
print("Added a value to the industry column for Eyeo and Appsmith, Marketing and Infrastructure respectivley")

print("_________________________________")

df.loc[df["company"] == "Fit Analytics", "country"] = "Germany"
df.loc[df["company"] == "Ludia", "country"] = "Canada"
print("Added a value to the country column for Fit Analytics and Ludia, Germany and Canada respectivley")

print("_________________________________")

df = df.reset_index(drop=True)
print("Reset Index")

print("_________________________________")

print("--- final shape ---")
print(df.shape)  

print("--- remaining nulls ---")
print(df.isnull().sum())  

print("--- data types ---")
print(df.dtypes)  

print("--- sample rows ---")
print(df.head(10))  

print("--- date range ---")
print(df["date"].min())
print(df["date"].max())

print("--- industry counts ---")
print(df["industry"].value_counts())

print("_________________________________")

df.to_csv("data/layoffs_clean.csv", index=False)
print("Save done")