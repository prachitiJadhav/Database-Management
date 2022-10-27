CREATE DATABASE HULU;
USE HULU;
CREATE TABLE TV_Shows_T (
TVShowID INT(10) NOT NULL,
TV_Show_Name VARCHAR(100),
Total_Seasons Int(10),
Ongoing VARCHAR(100),
CONSTRAINT TV_Shows_pk PRIMARY KEY (TVShowID))
ENGINE = INNODB;

CREATE TABLE Movies_T  (
MovieID INT(10) NOT NULL,
Movie_Name VARCHAR(100),
Movie_Length Int(10),
CONSTRAINT Movies_pk PRIMARY KEY (MovieID))
ENGINE = INNODB;

CREATE TABLE Subscription_Plans_T  (
PlanID INT(10) NOT NULL,
Plan_Description VARCHAR(100),
Plan_Price VARCHAR(100),
Plan_Video_Quality VARCHAR(100),
CONSTRAINT Subscription_Plans_pk PRIMARY KEY (PlanID))
ENGINE = INNODB;


CREATE TABLE HULU_Application_T  (
MediaTypeID INT(10) NOT NULL,
Genre VARCHAR(100),
Country VARCHAR(100),
Rating VARCHAR(100),
CensorRating VARCHAR(100),
IsFree CHAR(15),
MediaType VARCHAR(100),
CONSTRAINT HULU_Application_pk PRIMARY KEY (MediaTypeID))
ENGINE = INNODB;

CREATE TABLE User_T (
UserId INT(10) NOT NULL,
User_Fname VARCHAR(100),
User_Mname VARCHAR(100),
User_Lname varchar(100),
Address VARCHAR(100),
EmailID VARCHAR(100),
PhoneNumber VARCHAR(100),
LoginPassword VARCHAR(100),
UserType VARCHAR(100),
PlanId int(10),
MediaTypeID int(10),
CONSTRAINT User_pk PRIMARY KEY (UserId),
CONSTRAINT User_fk FOREIGN KEY (PlanId) REFERENCES Subscription_Plans_T(PlanId) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT User_fk1 FOREIGN KEY (MediaTypeID) REFERENCES HULU_Application_T(MediaTypeID) ON UPDATE CASCADE ON DELETE CASCADE)
ENGINE = INNODB;

CREATE TABLE FreeUser_T  (
FreeUserID INT(10) NOT NULL,
CONSTRAINT FreeUser_pk PRIMARY KEY (FreeUserID))
ENGINE = INNODB;

CREATE TABLE Subscriber_T  (
Subscriber_ID INT(10) NOT NULL,
SubscriberPlanType VARCHAR(20) NOT NULL,
CONSTRAINT Subscriber_pk PRIMARY KEY (Subscriber_ID))
ENGINE = INNODB;

CREATE TABLE Transaction_T (
TransactionID INT(10) NOT NULL,
Payment_Method VARCHAR(100),
Transaction_Date DATE,
Subscription_End_Date DATE,
Transaction_Amount DOUBLE,
UserID int(10),
CONSTRAINT Transaction_pk PRIMARY KEY (TransactionID),
CONSTRAINT Transaction_fk FOREIGN KEY (UserID) REFERENCES User_T(UserID) ON UPDATE CASCADE ON DELETE CASCADE)
ENGINE = INNODB;

CREATE TABLE Premiums_T (
Premium_ID INT(10) NOT NULL,
Cost VARCHAR(100),
MediaTypeID INT(10),
CONSTRAINT Premiums_pk PRIMARY KEY (Premium_ID),
CONSTRAINT Premiums_fk FOREIGN KEY (MediaTypeID) REFERENCES HULU_Application_T(MediaTypeID) ON UPDATE CASCADE ON DELETE CASCADE)
ENGINE = INNODB;

CREATE TABLE Originals_T (
Originals_ID INT(10) NOT NULL,
PaymentRequired CHAR(100),
MediaTypeID INT(10),
CONSTRAINT Originals_pk PRIMARY KEY (Originals_ID),
CONSTRAINT Originals_fk FOREIGN KEY (MediaTypeID) REFERENCES HULU_Application_T(MediaTypeID) ON UPDATE CASCADE ON DELETE CASCADE)
ENGINE = INNODB;


INSERT INTO TV_Shows_T (TVShowID, Tv_Show_Name, Total_Seasons, Ongoing)
VALUES
(101, 'Bakers Dozen', '1','Yes'),
(102, 'Insecure','5','No'),
(103, 'Dexter', '8', 'No'),
(104, 'Yellowjackets','1','Yes'),
(105,'Teen Titans Go','6','No'),
(106,'The Great','2','Yes'),
(107,'Family Guy','20','No'),
(108,'Ancient Aliens','14','No'),
(109,'Succession','3','No'),
(110,'P-Valley','1','No'),
(111,'Marvels Hit Monkey','1','Yes'),
(112,'Godfather of Harlem','2','Yes'),
(113,'Powerbook II','2','No'),
(114,'Wrong Man','2','No'),
(115,'Pen-15','2','Yes'),
(116,'Samurai Champloo', '1','Yes'),
(117,'Staged','2','Yes'),
(118,'Power','6','No'),
(119,'Black-ish','7','No'),
(120,'The Hardy Boys','1','Yes');


INSERT INTO Movies_T (MovieID, Movie_Name, Movie_Length)
VALUES
(201,'DeadPool 2',120),
(202, 'elf',97),
(203,'PIG', 92),
(204,'The Humans',108),
(205,'Norbit', 103 ),
(206,'Caged', 81 ),
(207,'Last Holiday',112),
(208,'Bad Boys for life',124),
(209,'Jumanji: The next level',123),
(210,'Grown Ups 2',101),
(211,'Queen Bees',100),
(212,'Jingle All The Way',80),
(213,'Iron Man 3',130),
(214,'Boss Baby',97),
(215,'The Holiday',138),
(216,'The Marksman',108),
(217,'Shrek 2',93),
(218,'Rush Hour',98),
(219,'The Misfits',94),
(220,'Christmas Cupid',85);

INSERT INTO Subscription_Plans_T (PlanID, Plan_Description, Plan_Price, Plan_Video_Quality) VALUES 
(1001, 'Monthly Hulu 30 day free trial', 6.99, 'standard'),
(1002, 'Monthly Hulu (no ads) 30 day free trial', 12.99, 'HD'),
(1003, 'Monthly Hulu + Live TV 7 day free trial', 64.99, '4K'),
(1004, 'Monthly Hulu, Disney+ and ESPN+ Bundle', 13.99, 'standard'),
(1005, 'Monthly Hulu, Disney+ and ESPN+ Bundle (no ads)', 19.99, 'HD'),
(1006, 'Monthly Hulu + Live TV, Disney+ and ESPN+ Bundle', 72.99, '4K');

INSERT INTO Hulu_Application_T (MediaTypeId, Genre, Country, Rating, Censorrating, IsFree, MediaType) VALUES 
(101,'Sitcom','USA','6.8','G','N','T'),
(102,'Drama','USA','7.9','PG-13','N','T'),
(103,'Mystery','USA','8.6','R','N','T'),
(104,'Drama','Canada','7.9','R','N','T'),
(105,'Action','USA','5.3','G','N','T'),
(106,'Historical','USA','8.1','PG','Y','T'),
(107,'Comedy','USA','8.1','G','Y','T'),
(108,'Documentary','UK','7.2','G','N','T'),
(109,'Comedy','USA','8.7','R','Y','T'),
(110,'Drama','USA','7.1','PG-13','N','T'),
(111,'Anime','USA','8.0','G','Y','T'),
(112,'Drama','USA','8.0','R','Y','T'),
(113,'Crime','UK','6.9','R','N','T'),
(114,'Crime','UK','7.1','R','Y','T'),
(115,'Comedy','Canada','8.0','PG','Y','T'),
(116,'Anime','Japan','8.5','PG-13','N','T'),
(117,'Action','USA','8.6','R','N','T'),
(118,'Crime','USA','8.1','R','N','T'),
(119,'Sitcom','USA','7.1','PG-13','N','T'),
(120,'Drama','UK','7.1','R','Y','T'),
(121,'Action','USA','7.7','R','Y','M'),
(122,'Comedy','USA','7.0','G','N','M'),
(123,'Drama','USA','6.9','R','N','M'),
(124,'Drama','USA','6.1','PG-13','Y','M'),
(125,'Comedy','USA','4.1','R','N','M'),
(126,'Crime','USA','3.6','PG-13','Y','M'),
(127,'Comedy','UK','6.5','G','N','M'),
(128,'Action','USA','6.6','PG-13','Y','M'),
(129,'Action','USA','6.7','G','N','M'),
(130,'Comedy','USA','5.4','PG','N','M'),
(131,'Comedy','UK','6.1','G','Y','M'),
(132,'Comedy','USA','5.7','G','N','M'),
(133,'Action','USA','7.1','G','Y','M'),
(134,'Comedy','USA','6.3','G','Y','M'),
(135,'Comedy','USA','6.9','PG','N','M'),
(136,'Action','USA','5.6','PG-13','N','M'),
(137,'Anime','USA','7.2','G','Y','M'),
(138,'Action','USA','6.5','PG-13','Y','M'),
(139,'Action','UK','4.2','R','N','M'),
(140,'Comedy','USA','5.6','G','Y','M');

INSERT INTO Premiums_T (Premium_ID, Cost, MediaTypeId) VALUES 
(1,4.99,136),
(2,5.99,122),
(3,9.99,116),
(4,2.99,117),
(5,4.99,123),
(6,3.99,118),
(7,9.99,132),
(8,5.99,104),
(9,8.99,129),
(10,7.99,102),
(11,8.99,127),
(12,3.99,139),
(13,9.99,101),
(14,6.99,135),
(15,2.99,103),
(16,8.99,119),
(17,5.99,125),
(18,8.99,113),
(19,3.99,108),
(20,7.99,130);

INSERT INTO User_T (UserID, User_Fname, User_Mname, User_Lname, Address, EmailID, PhoneNumber, LoginPassword, UserType, PlanID, MediatypeID) VALUES 
(1, 'Jessica', 'Eva', 'Parker' ,  '912 BStreet,California', 'jevaparker@yahoo.com', '3413255430', 'Jessp', 'FreeUser', 1002, 101),
(2, 'Laurie', 'H', 'Paul', '27 eagenalley,Texas', 'lpaul@gmail.com', '6413255770', 'Laupau', 'FreeUser', 1003, 102),
(3, 'Faye', 'Evans', 'DSouza', '8 Janacourt,Idaho', 'evansfayeyahoo.com', '5413255230',  'Fayep', 'FreeUser', 1002, 103),
(4, 'Kirsti', 'N', 'Gwillym', '8 OxfordCrossing,UK', 'KirstiG@outlook.com', '5013259930', 'gkirsti', 'Subscriber', 1004, 108),
(5, 'Terrence', 'Roger', 'Lewis', '5 DwereyPark,Arizona', 'Terryrl@yahoo.com', '9112345876' , 'Terrman', 'FreeUser', 1003, 104),
(6, 'Lazaro', 'W', 'Croster', '94542 Carlos Bee Blvd,California', 'Lazacross@yahoo.com', '3413259930', 'Lazac', 'FreeUser', 1002, 105),
(7, 'Hari', 'P', 'Rao', '333 ManhattanSt,New York', 'hariprasad@yahoo.com', '2313259930', 'Harir', 'FreeUser', 1003, 106),
(8, 'Naina', 'Ram', 'Reddy', '881 Sunnyvale,California', 'nainareddy@gmail.com', '5123252113', 'Reddyn', 'Subscriber', 1004, 107),
(9, 'Samhitha', 'Chakri', 'Pallelamudi', '511 Newtown,Florida', 'samhithap@yahoo.com', '2453259975', 'Sammy', 'FreeUser', 1001, 109),
(10, 'Anne', 'Holmes', 'Watson', '12wellingStreet, Misisippi', 'Annehw@yahoo.com', '8913259233', 'Holmes', 'FreeUser', 1001, 110),
(11, 'Iwette', 'B', 'David', '30 Autumnpark, Washington', 'Iwetteb@yahoo.com', '7613253450', 'David', 'Subscriber', 1005, 111),
(12, 'Paul', 'Steph', 'Hawkins', 'Melrosejunction,Canada', 'Stephenhawk@yahoo.com', '5012259321', 'Hawkin', 'Subscriber', 1006, 112),
(13, 'Olympie', 'H', 'Golborn', '22 Jasperst,Alabama', 'Olympus@gmail.com', '6752593442', 'OlympGlb', 'Subscriber', 1006, 113),
(14, 'Sam', 'Aaron', 'Manekshaw', '912 BStreet,California', 'Manesam@yahoo.com', '5589399391', 'Samm', 'Subscriber', 1004, 114),
(15, 'Danna', 'Roy', 'Chatterjee', '65 Larrypoint,Alaska', 'chatterjee@yahoo.com', '3213257938', 'Chatterg', 'Subscriber', 1006, 115),
(16, 'Devon', 'Heerick', 'Bollis', 'IndianSt,Texas', 'dheerick@yahoo.com', '5338259956', 'Devonh', 'Subscriber', 1005, 116),
(17, 'Val', 'B', 'Champken', '33 FlorenceStreet,UK', 'champkenval@yahoo.com', '4453251976', 'valc', 'Subscriber', 1006, 117),
(18, 'Melanie', 'Marie', 'Clinton', 'Nottinghill,New York', 'melaniec@yahoo.com', '5313256630', 'Clinton', 'Subscriber', 1006, 118),
(19, 'Rowela', 'Emma', 'Johnson', 'Elak lane,Ohio', 'johnsonowela@yahoo.com', '5119859965', 'Johrow', 'Subscriber', 1004, 119),
(20, 'Pooja', 'Pankaj', 'Agarwal', '221 Freemont,California', 'Poojaagarwal@yahoo.com', '4323257632', 'Poojaa', 'FreeUser', 1001, 120);

INSERT INTO Transaction_T
 (TransactionID, Payment_Method, Transaction_Date, Subscription_End_Date, Transaction_amount, UserID)
values
(101,'Credit','2021-11-01','2021-11-30','6.99',1),
(102,'Debit','2021-11-01','2022-11-30','69.99',2),
(103,'Credit','2021-11-05','2022-12-04','12.99',3),
(104,'Credit','2021-11-05','2022-11-04','69.99',4),
(105,'Debit','2021-11-01','2021-11-30','12.99',5),
(106,'ACH','2021-11-03','2021-12-02','6.99',6),
(107,'ACH','2021-11-04','2021-12-03','12.99',7),
(108,'Credit','2021-11-06','2021-12-05','6.99',8),
(109,'ACH','2021-12-06','2022-01-05','6.99',9),
(110,'Debit','2021-12-06','2022-01-05','6.99',10),
(111,'Credit','2021-12-06','2022-01-05','64.99',11),
(112,'Debit','2021-12-06','2022-01-05','64.99',12),
(113,'Credit','2021-12-06','2022-01-05','64.99',13),
(114,'ACH','2021-12-07','2022-01-06','70.99',14),
(115,'ACH','2021-12-08','2022-01-07','6.99',15),
(116,'ACH','2021-12-06','2022-01-05','12.99',16),
(117,'Credit','2021-12-09','2022-01-08','6.99',17),
(118,'Credit','2021-12-06','2022-01-05','70.99',18),
(119,'Credit','2021-12-06','2022-01-05','12.99',19),
(120,'Debit','2021-12-08','2022-01-07','64.99',20);

INSERT INTO Originals_T (Originals_ID, PaymentRequired, MediaTypeID)
VALUES
(900, "Y",101),
(901, "Y",102),
(902, "N",103),
(903, "N",104),
(904, "Y",105),
(905, "Y",106),
(906, "N",107),
(907, "Y",108),
(908, "N",109),
(910, "N",110),
(911, "Y",111),
(912, "N",112),
(913, "Y",113),
(914, "N",114),
(915, "Y",115),
(916, "Y",116),
(917, "N",117),
(918, "Y",118),
(919, "N",119),
(920, "Y",120);


INSERT INTO Subscriber_T (Subscriber_ID, SubscriberPlanType) VALUES
(4, '$13.99 Plan'),
(8, '$13.99 Plan'),
(11, '$19.99 Plan'),
(12, '$72.99 Plan'),
(13, '$72.99 Plan'),
(14, '$13.99 Plan'),
(15, '$72.99 Plan'),
(16, '$19.99 Plan'),
(17, '$72.99 Plan'),
(18, '$72.99 Plan'),
(19, '$13.99 Plan');

INSERT INTO FreeUser_T( FreeuserID) VALUES 
(1),
(2),
(3),
(5),
(6),
(7),
(9),
(10),
(20);


/* QUERY 1 */
/* Name the ongoing tv shows */
SELECT * FROM TV_Shows_T WHERE Ongoing = 'Yes';

/* QUERY 2 */
/* top 3 longest TV shows */
SELECT * FROM TV_Shows_T ORDER BY Total_Seasons DESC LIMIT 3;

/* query 3 */
/* showing movies whose movie_length is more than 2 hrs */
SELECT * FROM movies_T WHERE movie_length > 120;

/* query 4 - USING JOIN */
/* Max rating of each genre with its TVshow name*/
SELECT TS.TV_Show_Name, HA.Genre, MAX(HA.Rating) AS Max_Rating 
FROM TV_Shows_T TS 
INNER JOIN Hulu_Application_T HA
ON TS.TVShowID = HA.MediaTypeID
Group BY HA.Genre ORDER BY MAX(HA.Rating) DESC;

/* query 5 - view */
/* free movies in each censor rating */
CREATE view FreeMedia_view as 
SELECT Count(IsFree), CensorRating 
FROM Hulu_Application_T
WHERE IsFree='Y' GROUP BY CensorRating;

SELECT * FROM FreeMedia_view;

/*------------------  Queries for Transaction and Originals tables ------------------

/*Q-1 List all Original Shows and its related data which doesn't require payment.*/
SELECT Genre, Country, Rating, MediaType FROM Originals_T o 
INNER JOIN hulu_Application_t hApp 
on hApp.mediaTypeID = o.MediatypeID WHERE PaymentRequired = 'N';

/* Q-2 List all the Movies in the Hulu Application*/
SELECT * From hulu_application_t Where mediaType = 'M';

/* Q3 Group and List the Count of Transactions Happened on a monthly basis*/
SELECT monthName(transaction_date) as tdate, count(*) from transaction_T group by tdate;

/* Q4 Create a View For the generated Revenue with Running Total */
CREATE View totalRevenueByMonths as
SELECT
  monthName(transaction_date) as Month,
  SUM(transaction_amount) as transaction_amount
FROM transaction_T
GROUP BY Month;
Select * from totalRevenueByMonths;

/* Q5 Count the number of Transactions by grouping Plans accordingly */
Select Transaction_amount, count(Transaction_amount) 
from transaction_t 
Group by Transaction_amount
order by  count(Transaction_amount) Desc;

/* Q6 Print Customers Information who has a transaction amount >= 64.99 In order to send promotional offers or discounts to these users as 
they have choosen the best plans in all the existing ones*/
Select u.User_Fname,u.User_Lname, u.EmailID,t.Transaction_Amount
 from transaction_t t inner join user_t u
on t.UserID = u.UserId where t.Transaction_Amount >= 64.99 




