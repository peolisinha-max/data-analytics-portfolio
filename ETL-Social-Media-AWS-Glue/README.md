# Social Media Data Integration & ETL Pipeline (AWS Glue)

## Overview
This project focuses on building an end-to-end ETL pipeline using AWS Glue to integrate and analyze social media data from multiple sources (Twitter and Blogs). The goal was to transform raw data into meaningful insights for analysis and decision-making.

## Data Extraction
- Uploaded raw datasets (tweets and blogs) into Amazon S3  
- Organized data into structured folders for processing  

## Data Processing & Transformation
- Used AWS Glue Crawlers to automatically detect schema and create tables  
- Built ETL workflow using AWS Glue Visual ETL  
- Joined datasets based on user ID  
- Removed duplicate fields to ensure data quality  
- Extracted hashtags from tweet text using regular expressions  

## Data Aggregation
- Grouped data by user ID  
- Calculated key metrics such as:
  - Total number of tweets per user  
  - Minimum timestamp (user activity tracking)  

## Data Loading & Validation
- Stored processed data into an S3 output bucket  
- Validated results using SQL queries on S3 output  

## Tools Used
AWS Glue, Amazon S3, ETL, SQL, Data Transformation, Regex  

## Outcome
- Built a scalable ETL pipeline for multi-source data integration  
- Automated data cleaning, transformation, and aggregation  
- Generated structured data for further analysis such as user engagement and trends  
