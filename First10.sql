/*------------------ 
1) List all the columns of the Salespeople table
here is the query where we are fetching the data from salespeople
*/                   -----------------------

select * from Salespople;

/*----------------
2) List all customers with a rating of 100
here is the query to display customers of 100 rating where i used = function;
*/                    -------------------------

select * from Customers where RATING=100;

/*------------------
3) Find the largest order taken by each salesperson on each date
here you can see the below query where i used join operation to run the query here SNUM is the foreign key to join the tables ,use of order by to order the table in ascending order.
/*                     -------------------------

select Orders.AMT,Salespeople.SNUM,Salespeople.SNAME from Salespeople inner join Orders on Salespeople.SNUM=Orders.SNUM order by Orders.AMT;

/*-------------------
4) Arrange the Order table by descending customer number.
here you can see the query where i used DESC so that descending order get printed with the use of order by 
*/                    ---------------------------

select * from Orders order by CNUM desc;

/*---------------------
5) Find which salespeople currently have orders in the order table
here you can see the ,usage of distinct() which gets us differetnt values and also the join to connect with it.
/*                      ---------------------------

select distinct(Salespeople.SNAME),Salespeople.SNUM,Orders.SNUM from Salespeople inner join Orders on Salespeople.SNUM=Orders.SNUM;

/*----------------------
6) List names of all customers matched with the salespeople serving them
here you can see the usage of simple left join we can get the above data
here we have to find all the customers of each salespeople that we are serving.
*/                        ---------------------------

select Customers.CNAME,Customers.SNUM,Salespeople.SNAME from Customers left join Salespeople on Customers.SNUM=Salespeople.SNUM;

/*-------------------------
7) Find the names and numbers of all salespeople who have more than one customers
here you can see the usage of count() which gives us the counting of the data which we put inside the brackets,also the usage of group by where you can group your data with a particular field
*/                          -----------------------
 
select Salespeople.SNAME,Salespeople.SNUM,count(Salespeople.SNUM)>1 from Salespeople left join Customers on Salespeople.SNUM=Customers.SNUM group by Customers.SNUM;

/*---------------------------
8) Count the orders of each of the salespeople and output the results in descending order.
here you can see the usage of count() again but this time we used group by,desc also to get the data.
I personally used left join in this query so that all the data from the left mentioned table we get fetched and the matching with the second table we can get.
*/                              --------------------

 select Salespeople.SNAME,count(Orders.SNUM) from Salespeople left join Orders on Salespeople.SNUM=Orders.SNUM  group by Orders.SNUM  order by count(Orders.SNUM) desc;

/*-----------------------------
9) List the customer table if and only if one or more of the customers in the Customer table are located in SanJose.
here you can see the no complex query to fetch.
*/
                              -------------------------
select * from Customers where CITY='SanJose';

/*------------------------------- 
10) Match salespeople to customers according to what city they live in.
here you can see the usage of cross join to fetch the data
*/                                 -------------------------

select Salespeople.SNAME,Salespeople.CITY,Customers.CNAME,Customers.CITY from Customers cross join Salespeople on Customers.SNUM=Salespeople.SNUM;
