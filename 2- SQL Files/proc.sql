
GO
CREATE PROC Original_Content_Search @typename VARCHAR(20), @categoryname VARCHAR(20)
AS
BEGIN TRY
SELECT * FROM Original_Content C INNER JOIN Content CT 
ON C.id=CT.id
WHERE C.content_manager_id IS NOT NULL AND C.reviewer_id IS NOT NULL
AND(CT.type=@typename OR CT.category_type=@categoryname);
END TRY
begin catch
end catch
GO



GO

CREATE PROC Contributor_Search @fullname VARCHAR(100)
AS
BEGIN TRY
DECLARE @F_name VARCHAR(20)
DECLARE @M_name VARCHAR(20)
DECLARE @L_name VARCHAR(20)
SET @F_name =SUBSTRING(@fullname,0,CHARINDEX(' ',@fullname))
SET @M_name =SUBSTRING(@fullname,LEN(@F_name)+2,CHARINDEX(' ',@fullname,LEN(@F_name)+2)-(LEN(@F_name)+2))
SET @L_name=SUBSTRING(@fullname,LEN(@F_name)+LEN(@M_name)+3,LEN(@fullname)-(LEN(@F_name)+LEN(@M_name)+2))
 SELECT * FROM Contributor C INNER JOIN [User] US ON C.id=US.id
 WHERE US.first_name=@F_name AND US.middle_name=@M_name AND US.last_name=@L_name
END TRY
begin catch
end catch
 GO


CREATE PROC Register_User @usertype VARCHAR(40), @email VARCHAR(50), @password VARCHAR (20), @firstname VARCHAR (20), @middlename VARCHAR (20),
@lastname VARCHAR (20), @birth_date DATE, @working_place_name VARCHAR (30), @working_place_type VARCHAR (20),
@wokring_place_description VARCHAR (100), @specilization VARCHAR (30), @portofolio_link VARCHAR (100), @years_experience INT, @hire_date DATE,
@working_hours INT, @payment_rate decimal(10,2), @user_id INT OUTPUT
AS
BEGIN TRY
INSERT INTO [User] VALUES (@email,@firstname,@middlename,@lastname,@birth_date,@password,CURRENT_TIMESTAMP,1);
DECLARE @X INT = @@IDENTITY
SET @user_id=@X
IF(@usertype='Viewer')
INSERT INTO Viewer VALUES (@X,@working_place_name,@working_place_type,@wokring_place_description)
ELSE BEGIN 
DECLARE @NotifiedID INT
SELECT @NotifiedID=MAX(Notified_Person.id) FROM Notified_Person
INSERT INTO Notified_Person VALUES (@NotifiedID+1) 
IF(@usertype='Contributor')
INSERT INTO Contributor VALUES (@X,@years_experience,@portofolio_link,@specilization,@NotifiedID)
ELSE BEGIN 
INSERT INTO Staff VALUES (@X,@hire_date,@working_hours,@payment_rate,@NotifiedID)
IF(@usertype='Authorized Reviewer ')
INSERT INTO Reviewer VALUES (@X)
IF(@usertype='Content Manager')
INSERT INTO Content_Manager VALUES (@X,NULL)
END
END
END TRY
begin catch
end catch
GO



CREATE PROC Check_Type @typename VARCHAR(30), @content_manager_id INT
AS 
BEGIN TRY
IF(NOT EXISTS(SELECT * FROM Content_Type WHERE Content_Type.type=@typename))
INSERT INTO Content_Type VALUES (@typename)
UPDATE Content_Manager SET type=@typename WHERE id=@content_manager_id
END TRY
begin catch
end catch
GO



CREATE PROC Order_Contributor
AS 
BEGIN TRY
SELECT * FROM Contributor C INNER JOIN [User] U ON C.id=U.id
ORDER BY C.years_of_experience DESC
END TRY
begin catch
end catch
GO


CREATE PROC Show_Original_Content
@contributor_id INT
AS
BEGIN TRY
IF(@contributor_id IS NULL)
SELECT * FROM Original_Content O INNER JOIN Content CO ON O.id=CO.id INNER JOIN (Contributor C INNER JOIN [User] U ON C.id=U.id)
ON CO.contributer_id=C.id
ELSE
SELECT * FROM Original_Content O INNER JOIN Content CO ON O.id=CO.id INNER JOIN (Contributor C INNER JOIN [User] U ON C.id=U.id)
ON CO.contributer_id=C.id AND C.id=@contributor_id
END TRY
begin catch
end catch
GO





/*1 Login to the website using my email and password which checks that I am an existing user and
whether I am a Viewer, Contributor, Authorized Reviewer or Content manager using a procedure
called ’User_login @email, @password, @user_id OUTPUT’ if the user is not registered or not
allowed to login (deleted account) the @user_id value will be (-1). I will be able to
reactivate my profile by logging in on the website. If more than 2 weeks passed without
logging in,then I wonât be able to login on the website. Note: The account will 
not be deleted. (Check number 4)*/

CREATE PROC User_login @email VARCHAR(50), @password VARCHAR(20), @user_id INT OUTPUT
AS
BEGIN TRY
IF(EXISTS(SELECT * FROM [USER] U WHERE email=@email AND password=@password AND (U.active=1 OR datediff(dd,login_date,getdate())<=14)))
BEGIN
SELECT @user_id=[User].id FROM [User] WHERE [User].email=@email AND [User].password=@password
UPDATE [USER] SET login_date=getdate(),active=1
END
ELSE 
SET @user_id=-1
END TRY
begin catch
end catch
GO


/*2 Show my profile that contains all my possible information using a procedure called 
’Show_Profile @user_id, @email OUTPUT, @password OUTPUT, @firstname OUTPUT, @middlename
OUTPUT, @lastname OUTPUT, @birth_date OUTPUT, @working_place_name OUTPUT, @working_place_type
OUTPUT, @wokring_place_description OUTPUT, @specilization OUTPUT,@portofolio_link OUTPUT,
@years_experience OUTPUT, @hire_date OUTPUT, @working_hours OUTPUT, @payment_rate OUTPUT’
. If the account is deleted then the returned values are null.*/

CREATE PROC Show_Profile
@user_id INT, @email VARCHAR(50) OUTPUT, @password VARCHAR(50) OUTPUT,
@firstname VARCHAR(20) OUTPUT,@middlename VARCHAR(20) OUTPUT, 
@lastname VARCHAR(20) OUTPUT, @birth_date DATE OUTPUT,@working_place_name VARCHAR(20) OUTPUT,
@working_place_type VARCHAR(30) OUTPUT,@wokring_place_description VARCHAR(300) OUTPUT,
@specilization VARCHAR(100) OUTPUT,@portofolio_link VARCHAR(50) OUTPUT,
@years_experience INT OUTPUT, @hire_date DATE OUTPUT, 
@working_hours INT OUTPUT, @payment_rate DECIMAL (10, 2) OUTPUT
AS
BEGIN TRY
SELECT @email=U.email,@password=U.PASSWORD,@firstname=U.first_name
,@middlename=U.middle_name,@lastname=U.last_name,@birth_date=U.birth_date
FROM [USER] U WHERE U.id=@user_id
SELECT @working_place_name=V.working_place,@working_place_type=V.working_place_type,
@wokring_place_description=V.working_place_decribtion FROM Viewer V WHERE V.id=@user_id
SELECT @specilization=C.specialization,@portofolio_link=C.portfolio_link,
@years_experience=C.years_of_experience FROM Contributor C WHERE C.id=@user_id
SELECT @hire_date=S.hire_date,@working_hours=S.working_hours,
@payment_rate=S.payment_rate FROM Staff S WHERE S.id=@user_id
END TRY
begin catch
end catch
GO


/*3 Edit all my personal information using a procedure called ’Edit_Profile @user_id, @email,
@password, @firstname, @middlename, @lastname, @birth_date, @working_place_name, 
@working_place_type,@wokring_place_description, @specilization, @portofolio_link,
@years_experience, @hire_date,@working_hours, @payment_rate’.*/

CREATE PROC Edit_Profile @user_id INT , @email VARCHAR(50), @password VARCHAR(30), @firstname VARCHAR(20),
@middlename VARCHAR(20), @lastname VARCHAR(20),@birth_date DATE, @working_place_name VARCHAR(20),
@working_place_type VARCHAR(20),@wokring_place_description VARCHAR(50),@specilization VARCHAR(100),
@portofolio_link VARCHAR(50), @years_experience INT, @hire_date DATE,
@working_hours INT, @payment_rate DECIMAL (10, 2)
AS
BEGIN TRY
UPDATE [USER] SET email=@email,PASSWORD=@password,first_name=@firstname,middle_name=@middlename,
last_name=@lastname,birth_date=@birth_date WHERE ID=@user_id;
UPDATE Viewer SET working_place=@working_place_name,working_place_type=@working_place_type,
working_place_decribtion=@wokring_place_description WHERE ID=@user_id;
UPDATE Contributor SET specialization=@specilization,portfolio_link=@portofolio_link,
years_of_experience=@years_experience WHERE ID=@user_id;
UPDATE Staff SET hire_date=@hire_date,working_hours=@working_hours,payment_rate=@payment_rate WHERE ID=@user_id
END TRY
begin catch
end catch
GO


/*4 Deactivate my profile using a procedure called ’Deactivate_Profile @user_id’.*/

CREATE PROC Deactivate_Profile @user_id INT
AS
BEGIN TRY
UPDATE [USER]  SET active=0 WHERE id=@user_id
END TRY
begin catch
end catch
GO


/*5 Show events with all its’ information and the viewer’s first name, second name,
and last name who created the event (do not include Advertisement) ’Show_Event @event_id’.
If the event is null,you should show all the coming events. Otherwise,
show the specified event.*/

CREATE PROC Show_Event @event_id INT
AS
BEGIN TRY
IF(@event_id IS NOT NULL)
SELECT E.*,U.first_name,U.middle_name,U.last_name FROM event E INNER JOIN [USER] U 
ON E.viewer_id=U.id
WHERE E.id=@event_id
ELSE
SELECT E.*,U.first_name,U.middle_name,U.last_name FROM event E INNER JOIN [USER] U 
ON E.viewer_id=U.id
WHERE (E.time - CURRENT_TIMESTAMP) >= 0
END TRY
begin catch
end catch
GO


/*6 Show my notifications if I am either a staff member or contributor using a procedure called
’Show_Notification @user_id’.*/

CREATE PROC Show_Notification @user_id INT
AS
BEGIN TRY
IF(EXISTS(SELECT * FROM Contributor WHERE Contributor.id=@user_id))
SELECT * FROM Contributor C INNER JOIN Notified_Person N
ON C.id=N.id INNER JOIN announcement A ON A.notified_person_id=N.id
ELSE
SELECT * FROM Staff S INNER JOIN Notified_Person N
ON S.id=N.id INNER JOIN announcement A ON A.notified_person_id=N.id
END TRY
begin catch
end catch
GO


/*7 Search for the new content that I ordered showed along with the name and id of the
contributor who uploaded them using a procedure called ’Show_New_Content @viewer_id,
@content_id’. If the user does not specify a new content, all new content should be shown.*/

CREATE PROC Show_New_Content @viewer_id INT, @content_id INT
AS
BEGIN TRY
IF(@content_id IS NOT NULL)
SELECT * FROM New_Request R INNER JOIN (New_Content C INNER JOIN 
 Content CO ON CO.id=C.id) ON C.new_request_id=R.id INNER JOIN
(Contributor C1 INNER JOIN [USER] U ON C1.id=U.id) ON C1.id=CO.contributer_id
WHERE R.viewer_id=@viewer_id AND C.id=@content_id
ELSE
SELECT * FROM New_Request R INNER JOIN (New_Content C INNER JOIN 
 Content CO ON CO.id=C.id) ON C.new_request_id=R.id INNER JOIN
(Contributor C1 INNER JOIN [USER] U ON C1.id=U.id) ON C1.id=CO.contributer_id
WHERE R.viewer_id=@viewer_id
END TRY
begin catch
end catch

GO 


-------------------------------------------------------------------------------------------------------------------------------------------------
--procedures beltagy ((  viewers ))
-------------------------------------------------------------------------------------------------------------------------------------------------

--procedure number (1)  ##
go



create proc Viewer_Create_Event
@city varchar (20),
 @event_date_time datetime,
 @description varchar(200),
 @entartainer varchar (40),
 @viewer_id int,
 @location varchar(30),
 @event_id int OUTPUT
 as
 begin
 BEGIN TRY
 INSERT Notification_Object DEFAULT VALUES;
 declare @idd int;
 set @idd =IDENT_CURRENT('Notification_Object')
 insert into event values (@description,@location,@city,@event_date_time,@entartainer,@idd,@viewer_id)
 set @event_id=IDENT_CURRENT('event')

Select *
Into   #Temp
From   Notified_Person
Declare @cId int
While (Select Count(*) From #Temp) > 0
Begin
    Select Top 1 @cId = Id From #Temp
	print @cid
	insert into announcement values(null,CURRENT_TIMESTAMP,@cId,@idd)
    Delete from #Temp Where Id = @cId
end
drop table #Temp
END TRY
begin catch
end catch
End
 

 






 -- procedure number (2)##
 go
 create proc Viewer_Upload_Event_Photo
 @event_id int ,
 @link varchar (100)
 as
 BEGIN TRY
 begin
 insert into event_photos_link values(@event_id ,@link)
 end
END TRY
begin catch
end catch
go
 create proc Viewer_Upload_Event_Video 
 @event_id int,
 @link varchar (100)
 as 
 BEGIN TRY

 begin
 insert into event_videos_link values (@event_id,@link)
 end
END TRY
begin catch
end catch
 
 go
 --procedure number (3)
 go
 create proc Viewer_Create_Ad_From_Event 
 @event_id int
 as
 begin
 BEGIN TRY
 declare @des varchar(200),
 @loc varchar (20),@v_id int
 select @des= description,@loc=location,@v_id= viewer_id
 from event
 where id=@event_id
 insert into advertisement values (@des,@loc,@event_id,@v_id)
END TRY
begin catch
end catch
 end

 
 --procedure number (4)
 go
create proc Apply_Existing_Request
@viewer_id int,
@original_content_id int
as
begin
BEGIN TRY
declare @average real
select @average=avg(rate)
from rate
where original_content_id=@original_content_id
if(@average>=4)
insert into Existing_Request values(@original_content_id,@viewer_id)
else print 'you cant apply for it'
END TRY
begin catch
end catch
end



--procedure number (5) not compleate..
--Apply for a new request along with the information of the needed new content using a procedure
--called ’Apply_New_Request @information, @contributor_id, @viewer_id’. @contributor_id can
--be null if the contributor is not specified. After the new request is created it should send a notification
--to the contributor (one or many).
go
create proc Apply_New_Request
@information varchar (200),
@contributor_id int ,
@viewer_id int 

as 
begin
BEGIN TRY
INSERT Notification_Object DEFAULT VALUES;
 declare @idd int;
 set @idd =IDENT_CURRENT('Notification_Object')
 if @contributor_id is not null
  begin
	declare @not_id int;
	select @not_id=notified_id
	from Contributor
	where id=@contributor_id
	insert into announcement values(null,CURRENT_TIMESTAMP,@not_id,@idd)
	insert into New_Request values(0,1,@information,@viewer_id,@idd,@contributor_id)
	end
 else
	begin
	Select *
	Into   Temp
	From   Notified_Person
	Declare @cId int
	While (Select Count(*) From Temp) > 0
	Begin
		Select Top 1 @cId = Id From Temp
		if(exists(select * from Contributor where notified_id=@cId))
		begin
		insert into announcement values(null,CURRENT_TIMESTAMP,@cId,@idd)
		end
		Delete Temp Where Id = @cId
	End
	drop table Temp
	insert into New_Request values(0,0,@information,@viewer_id,@idd,@contributor_id)
	end
END TRY
begin catch
end catch
end
go

create proc Delete_New_Request
@request_id int
as
begin
BEGIN TRY
declare @acc bit
select @acc =accept_status
from New_Request
where @request_id=id
if(@acc=0)
delete from New_Request 
where id=@request_id
else
print 'you cant the request is under processing'
END TRY
begin catch
end catch
end


--procedure number (7)
go
create proc Rating_Original_Content
@orignal_content_id int,
@rating_value int,
@viewer_id int
as
begin 
BEGIN TRY
insert into rate values (@viewer_id,@orignal_content_id,GETDATE(),@rating_value)
declare @average real
select @average=avg(rate)
from rate
where original_content_id=@orignal_content_id
update Original_Content set rating = @average
END TRY
begin catch
end catch
end


--procedure number (8)
--Write a comment on the original content using a procedure called ’Write_Comment @comment_text,
--@viewer_id, @original_content_id, @written_time’.

go
create proc Write_Comment
@comment_text varchar (500),
@viewer_id int ,
@original_content_id int ,
@written_time date
as
begin
BEGIN TRY
insert into comment values(@viewer_id,@original_content_id,@written_time,@comment_text)
END TRY
begin catch
end catch
end


 --procedure number(9)

 --  Edit my comment on any original content using a stored procedure called ’Edit_Comment @comment_
--   text, @viewer_id, @original_content_id, @last_written_time, @updated_written_time’
go
create proc Edit_Comment
@comment_text varchar (500), 
@viewer_id int,
@original_content_id int, 
@last_written_time date, 
@updated_written_time date
as
begin
BEGIN TRY
update comment
set text=@comment_text ,[date]=@updated_written_time
where Viewer_id = @viewer_id and original_content_id = @original_content_id and [date] = @last_written_time
END TRY
begin catch
end catch
end


-- procedurenumber (10).
--Delete my comment using a procedure called ’Delete_Comment @viewer_id, @original_content_id,
--@written_time’.
go
create proc Delete_Comment
@viewer_id int,
@original_content_id int,
@written_time datetime
as
begin
BEGIN TRY
delete from comment 
where Viewer_id=@viewer_id and original_content_id=@original_content_id and [date] =@written_time
END TRY
begin catch
end catch
end
go

--procedure number (11)

--Create an advertisement by providing all the needed information for publicity using a procedure
--called ’Create_Ads @viewer_id,@description, @location’.
go
create proc Create_Ads
@viewer_id int ,
@description varchar (200), 
@location varchar(20)
as
begin
BEGIN TRY
insert into advertisement values (@description,@location,null,@viewer_id)
END TRY
begin catch
end catch
end



-- procedure number (12)

--Edit my advertisement using a procedure called ’Edit_Ad @ad_id,@description, @location’.
go
create proc Edit_Ad
@ad_id int,
@description varchar (200),
@location varchar (20)
as 
begin 
BEGIN TRY
update advertisement 
set descripition =@description,location=@location
where id=@ad_id
END TRY
begin catch
end catch
end 


--procedure number (13)
--
--Delete my advertisement using a procedure called ’Delete_Ads @ad_id’.
go
create proc Delete_Ads
@ad_id int
as 
BEGIN TRY
begin
delete from advertisement
where id=@ad_id
end
END TRY
begin catch
end catch



--procedure number (14)

--Send a message to the contributor using a procedure called ’Send_Message @msg_text, @viewer_
--id, @contributor_id, @sender_type, @sent_at’. Sender type is boolean. It is one when the
--sender is a contributor, zero otherwise.
go
create proc Send_Message
@msg_text varchar (500),
@viewer_id int, 
@contributor_id int,
@sender_type bit,
@sent_at datetime
as
begin
BEGIN TRY
insert into Message values (@sent_at,@contributor_id,@viewer_id,@sender_type,null,@msg_text,0)
END TRY
begin catch
end catch
end
go


--procedure number (15)

--Show all messages to/from a contributor using a procedure called ’Show_Message @contributor_id’.
go
create proc Show_Message
@contributor_id int
as
begin
BEGIN TRY
select *
from message 
where contributer_id=@contributor_id
END TRY
begin catch
end catch
end

--procedure number (16)
--Show the original content having the highest rating using a procedure called
--’Highest_Rating_Original_content’.
go
create proc Highest_Rating_Original_content
as
begin
BEGIN TRY

declare @idd int 
select @idd=max(rating) from Original_Content
select * from Original_Content
where rating=@idd 

END TRY
begin catch
end catch
end


--procdure number (17).
--Assign a contributor to a new request. The viewer can NOT re-apply on a rejected new request
--even if the contributor is different using a procedure called ’Assign_New_Request @request_id
--@contributor_id’. Note that the viewer can not reassign the request to a contributor if the request
--is accepted by another one.
go
create proc Assign_New_Request 
@request_id int,
@contributor_id int
as
begin
BEGIN TRY
if(exists (select * from New_Request where @request_id=id
and accept_status=1 and specified= 0)
)
update New_Request 
set contributer_id=@contributor_id
END TRY
begin catch
end catch
end

go
-- diplays the requests that the contributor can receive or a specific one if it's directed to him\her

go
-- checks if the contributor is able to receive requests with a limit of 3 requests at a time


create proc Receive_New_Requests @request_id int, @contributor_id int --if request id is not null displays the specified request else it displays all requests without a contributor
as	
begin try--if specified value is 0 contibutor id should be null but it can't be because it's a primary key , solve :v 
if @request_id is null												 -- new request that has a new content is considered finished
begin
select * from new_request nr
where (@contributor_id = nr.contributer_id and nr.specified=1) or nr.specified=0
end 
else
begin
select * from new_request nr
where (@contributor_id = nr.contributer_id and nr.id=@request_id and nr.specified=1) 
end;
end try
begin catch
end catch
go
---------------------------------------------------------------------------------------------------------------------------------------------------
go
-- accepts or rejects a request directed to the contributor
create proc Respond_New_Request @contributor_id int
, @accept_status bit, @request_id int 
AS
BEGIN TRY
begin 
declare @can_receive bit
exec Receive_New_Request @contributor_id, @can_receive output

if(@can_receive =0)
print('can not receive more than 3')
else
begin
if(@accept_status =0)
begin
 update new_request 
 set accept_status= @accept_status
 where id = @request_id and (specified=0 or @contributor_id= contributer_id)
 end
 else 
 begin 
 if (exists(select *from New_Request where id = @request_id and specified =0))
 begin 
 update new_request 
 set accept_status= @accept_status, specified=1 ,contributer_id= @contributor_id
 where id = @request_id 

end
end
end
end
END TRY
begin catch
end catch
 go 

-- uploads original content by a certain contributor to be filtered then displayed
 create proc Upload_Original_Content @type_id varchar(40) ,@subcategory_name varchar(40)
 , @category_id varchar(40) , @contributor_id int , @link varchar(200)
 as
 BEGIN TRY
 begin
 declare @ogID int
 insert into content values(@link,CURRENT_TIMESTAMP,@contributor_id,@category_id,@subcategory_name,@type_id)
  set @ogID =ident_current('content')
 insert into original_content values(@ogID,null,null,0,0,null); 
 end
END TRY
begin catch
end catch
 go
 --------------------------------------------------------------------------------------------------------------------------------------------------
-- uploads new content by a certain contributor based on a viewer request
 
 create proc Upload_New_Content @new_request_id int, @contributor_id int, @subcategory_name varchar(40)
 , @category_id varchar(40), @link varchar(200)
 as 
 BEGIN TRY
 begin
 insert into content values(@link,CURRENT_TIMESTAMP,@contributor_id,@category_id,@subcategory_name,null) 
 declare @ogID int
  set @ogID =ident_current('content')
 insert into new_content values(@ogID,@new_request_id,null); 
 end
END TRY
begin catch
end catch
---------------------------------------------------------------------------------------------------------------------------------------------------
go
-- deletes content of a certain contributor
create proc Delete_Content @content_id int
as 
BEGIN TRY
if(exists(
select * from original_content
where  id = @content_id  
and reviewer_id is not null and content_manager_id is not null))
begin                                                    
delete from Existing_Request where original_content_id = @content_id  
delete from original_content where id = @content_id 
delete from content where id = @content_id 
end

END TRY
begin catch
end catch






go

 create proc Reviewer_Filter_Content
@reviewer_id int,  @original_content int, @status bit
as
BEGIN TRY
if(exists(select * from [Original_Content] O where @original_content=O.id and O.reviewer_id is null))
begin
update  [Original_Content]
 set [Original_Content].filter_status= @status ,[Original_Content].reviewer_id =@reviewer_id
 where [Original_Content].id = @original_content
end  
else 
print('reviewer already reviewed or the content does not exist')

END TRY
begin catch
end catch
go
       
------------------------------------------------------------------------------------------
	   --2
 create proc content_manager_filter_content 
@content_manager_id int,  @original_content int, @status bit
as
BEGIN TRY
if(exists(
select * from Original_Content where @original_content=id and content_manager_id is null) AND exists(
select * from Original_Content inner join content on Original_Content.id= Content.id and Original_Content.id=@original_content
inner join Content_Manager on content.type=Content_Manager.type and content_manager_id=@content_manager_id
))
begin
update Original_Content 
 set original_content.filter_status= @status ,content_manager_id =@content_manager_id
 where id = @original_content
end  
END TRY
begin catch
end catch
go
-----------------------------------------------------------------------------------------------
		--3
create proc Staff_Create_Category
 @category_name varchar(20)
as
BEGIN TRY
insert into Category values (@category_name,null)
END TRY
begin catch
end catch
go
-----------------------------------------------------------------------------------------------
				--4

create proc Staff_Create_Subcategory @category_name varchar(20) , @subcategory_name varchar(20)
as 
BEGIN TRY
if(exists(select * from Category C where C.type =@category_name))
begin
 insert into Sub_category values(@category_name,@subcategory_name)
end
else print('the category is not exist')
END TRY
begin catch
end catch
go
-----------------------------------------------------------------------------------------------
			--5
create proc Staff_Create_Type @type_name varchar(100)
 as
 BEGIN TRY
 insert into Content_Type values(@type_name)
END TRY
begin catch
end catch
 go

------------------------------------------------------------------------------------------------
											--6
create proc Most_Requested_Content
 as
 BEGIN TRY
 select O.id ,count(E.id) as Count 
 from Original_Content O inner join Existing_Request E on E.original_content_id=O.id
 group by O.id
 order by Count desc
END TRY
begin catch
end catch
 go
--------------------------------------------------------------------------------------------------
										--7
create proc Workingplace_Category_Relation
 as
 BEGIN TRY
 select v.working_place_type ,c.type,count (e.id) as Requested_Count
 from Viewer v inner join  Existing_Request e on v.id=e.viewer_id 
			inner join Content c on e.original_content_id=c.id
group by v.working_place_type,c.type	
END TRY
begin catch
end catch

--------------------------------------------------------------------------------------------------
								--8
 -- this was deleted according to ahmed...
--------------------------------------------------------------------------------------------------
         -- 9
		 go
 create proc Delete_Original_Content
 @content_id int
 as
 BEGIN TRY
 if(exists(select * from [Original_Content] O where O.id = @content_id))
 begin
  SET NOCOUNT ON 
 delete from [Original_Content] 
 where [Original_Content].id = @content_id
 end
 else print ('this id is not exixt')
END TRY
begin catch
end catch
 go
 -----------------------------------------------------------------------------------------------------
		--10
 create proc Delete_New_Content 
  @content_id int
  as 
  BEGIN TRY
  if(exists(select * from [Content] C where C.id = @content_id))
  begin
   SET NOCOUNT ON 
 delete from [Content]
 where [Content].id = @content_id
 end
 else print ('this id is not exixt')
END TRY
begin catch
end catch
 go
 ---------------------------------------------------------------------------------------------------------

 -------------------------------------------------------------
		--11
	GO
 create proc Assign_Contributor_Request 
  @contributor_id int ,
  @new_request_id int
  as 
  BEGIN TRY
  update New_Request set contributer_id=@contributor_id where id=@new_request_id
END TRY
begin catch
end catch

  ------------------------------------------------------------------------------------------------------------------------
  GO
CREATE PROC Show_Possible_Contributors
AS
BEGIN TRY
SELECT CR.ID,AVG(DATEDIFF(DD,C.uploaded_at,NC.upload)) AS S INTO TEMP FROM Contributor CR INNER JOIN Content C ON CR.id=C.contributer_id 
INNER JOIN New_Content NC ON NC.id=C.id AND NC.upload IS NOT NULL
GROUP BY CR.id
SELECT CR.ID,count(*) AS S1 INTO TEMP1 FROM Contributor CR INNER JOIN Content C ON CR.id=C.contributer_id 
INNER JOIN New_Content NC ON NC.id=C.id INNER JOIN New_Request NR ON NC.new_request_id=NR.id
WHERE NR.specified=1
GROUP BY CR.id
SELECT CR.ID,count(*) AS S2 INTO TEMP2 FROM Contributor CR INNER JOIN Content C ON CR.id=C.contributer_id 
INNER JOIN New_Content NC ON NC.id=C.id INNER JOIN New_Request NR ON NC.new_request_id=NR.id 
WHERE NR.specified=1 and upload IS NULL and nr.accept_status=1
GROUP BY CR.id
SELECT TEMP1.* FROM TEMP INNER JOIN TEMP1 ON TEMP.ID=TEMP1.id , TEMP2 
where TEMP2.S2 < 3
ORDER BY S,S1 DESC 
DROP TABLE TEMP
DROP TABLE TEMP1
DROP TABLE TEMP2
exec Show_Possible_Contributors
END TRY
begin catch
end catch

