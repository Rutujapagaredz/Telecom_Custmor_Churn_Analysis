Use project;
Select * from cleaned_churn_analysis;
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM 
    cleaned_churn_analysis
GROUP BY 
    Contract
ORDER BY 
    churn_rate_percent DESC;
    
    
SELECT 
    InternetService,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) AS Churned_Customers,
    COUNT(*) AS Total_Customers,
    ROUND(
        (COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM 
    cleaned_churn_analysis
GROUP BY 
    InternetService
ORDER BY 
    Churn_Rate_Percentage DESC;


