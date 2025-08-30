use consumer;

select * from complaints;

describe  complaints;

alter table complaints
modify `Complaint ID` int primary key;



# 1. Total number of Complaints

select count(*) as total_complaints 
from complaints ;



# 2. How many unique states have reported complaints ?

select count(distinct State) as unique_states 
from complaints ; 



# 3. List all the distinct products consumers have complaints about.

select Distinct Product as Distinct_Products 
from complaints ;



# 4. What are the different submission channels
#    through which complaints were submitted ?

select Distinct `Submitted via`, count(*) as Via_Count,
round(count(*)/(select count(*) from complaints)*100 ,2)
 as `Percentage Count`
from complaints 
group by `Submitted via`;



        # Seasonal Trend

# 5. Are there any months or seasons when consumer complaints spike?

select `Submitted Month`, count(*) as complaints_count,
round(( count(*) / (select count(*) from complaints) * 100), 2)
as `Percentage count`
from complaints 
group by `Submitted Month` 
order by complaints_count desc ;



# 6. Can you identify patterns across years?

select `Submitted Year`, count(*) as complaints_count 
from complaints 
group by `Submitted Year` order by complaints_count ;

        # Product-Level Insights
      
      
      
# 7. Which top 3 financial products receive the most complaints?

select `Product`, count(*) as most_complaints,
round(( count(*) / (select count(*) from complaints) * 100),2) 
as `Percentage_count`
from complaints 
group by `Product` 
order by most_complaints desc limit 3 ;



# 8. What are the top 3 issues associated with the top product?

select `Product`,`Issue`, count(*) as top_Product_Issue_count 
from complaints 
where `Product` = 'Checking or savings account'
group by `Issue`, `Product` 
order by top_Product_Issue_count desc limit 3;

	 # Resolution and Timeliness
     
     
     
# 9. How are complaints typically resolved 

select `Company response to consumer`, count(*) as count,
round(( count(*) / (select count(*) from complaints) * 100),2)
from complaints 
group by `Company response to consumer`
order by count desc ;



# 10. What percentage of complaints receive untimely responses?

select round((sum(case when `Timely response?` = 'No' then 1 else 0 end) / count(*)) * 100, 2) 
as untimely_percentage
from complaints;



# 11. Timely response percentage?

select `Timely response?`, round(count(*) /(select count(*) from complaints ) * 100 , 2)
as `Timely response percentage` 
from complaints group by `Timely response?`  ;
       
       
       # Deeper Insights



# 12. Are untimely responses more frequent for specific product types or issues?

create view product_wise_count_repsonsess
as (select Product, `Timely response?`, count(*) as responses_count
 from complaints group by Product, `Timely response?` order by Product);

select * from product_wise_count_repsonses ;

create view product_resposne_counts as
(select Product, count(*) as total_reponses from complaints group by Product) ;

# joining views
select a.Product, a.`Timely response?`,responses_count/total_reponses  from product_wise_count_repsonsess as a join product_resposne_counts as b
ON a.Product= b.Product   ;



# 13. How does resolution type vary across complaint categories?

select distinct Product, `Company response to consumer`, count(*) as resolution_count,
round((count(*) / (select count(*) from complaints)* 100),2) as Product_Percentage
from complaints
group by Product, `Company response to consumer` 
order by resolution_count desc limit 10 ;



# 14. What are the top 5 states by complaint volume  also find Percentage ?

select State, count(*) as total_count ,
round(( count(*) * 100) / ( select count(*) from complaints),2) 
as `Percentage of top 5 city`
from complaints 
group by State 
order by count(*) desc limit 5 ; 



# 15. Which Products received the most Complaints ?

select Product, count(*) as Most_complaints 
from complaints 
group by Product 
order by Most_complaints  desc limit 5 ;



# 16. How many complaints where received for each submisssion channel 

select `Submitted via`, count(*) as total_submission_complaints 
from complaints 
group by `Submitted via` 
order by total_submission_complaints desc limit 5 ; 



# 17. How many complaints received a timely reponse ?

select `Timely response?`,count(*) as count 
from complaints 
group by `Timely response?` ; 



# 18 .How many complaints were closed with explanation vs monetary relif

select `Company response to consumer`, count(*) as count
from complaints
where `Company response to consumer` in ('Closed with explanation' , 'Closed with monetary relief')
group by `Company response to consumer`;



# 19. How many complaints were received each year ?

select year(`Date received`), count(*) as count_complaints,
round(( count(*) / (select count(*) from complaints)*100),2)
as `Yearly Percentage Count`
from complaints
group by year(`Date received`) ;
 
 
 
 # 20. Which public response was provided most frequently?

 select `Company public response`, count(*) as count,
 round((count(*) / (select count(*) from complaints ) * 100),2) as `Public Response Percentage`
 from complaints  
 group by `Company public response` 
 order by count desc ;



# 21. Top 3 issues in the state of California (CA).

select Issue, State , count(*) as count  
from complaints 
where State = 'CA' 
group by Issue , State
order by count desc limit 3 ;



# 22. Top 5 Complaints with both a sub-issue and a company public response.

select `Sub-issue`, `Company public response`, count(*) as count,
round((count(*) / ( select count(*) from complaints) * 100),2) as Percentage
from complaints 
group by `Sub-issue`, `Company public response` 
order by count desc limit 5;














































