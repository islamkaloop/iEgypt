alter PROC Show_Notification 
go
/*6 Show my notifications if I am either a staff member or contributor using a procedure called
’Show_Notification @user_id’.*/

CREATE PROC Show_Notification @user_id INT
AS
BEGIN TRY
IF(EXISTS(SELECT * FROM Contributor WHERE Contributor.id=@user_id))
SELECT * FROM Contributor C INNER JOIN Notified_Person N
ON C.id=N.id INNER JOIN announcement A ON A.notified_person_id=N.id inner join Notification_Object o on a.notification_object_id=o.id , event e ,New_Request r
where (o.id=e.notification_object_id or o.id=r.notif_obj_id) and c.id=@user_id
ELSE
SELECT * FROM Staff S INNER JOIN Notified_Person N
ON S.id=N.id INNER JOIN announcement A ON A.notified_person_id=N.id inner join Notification_Object o on a.notification_object_id=o.id , event e ,New_Request r
where (o.id=e.notification_object_id or o.id=r.notif_obj_id) and s.id=@user_id
END TRY
begin catch
end catch


go
drop proc Delete_Original_Content

 go
 create proc Delete_Original_Content
 @content_id int
 as
 BEGIN TRY
 if(exists(select * from [Content] O where O.id = @content_id))
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

CREATE PROCEDURE filtered
	
AS
	begin
	
	select * from Original_Content where review_status =1  and filter_status =0
	end

go

ALTER TABLE [user]
ADD UNIQUE(email);

GO
ALTER PROC Show_Original_Content
@contributor_id INT
AS
BEGIN TRY
IF(@contributor_id IS NULL)
SELECT * FROM Original_Content O INNER JOIN Content CO ON O.id=CO.id INNER JOIN (Contributor C INNER JOIN [User] U ON C.id=U.id)
ON CO.contributer_id=C.id WHERE O.filter_status='TRUE' AND O.review_status='TRUE'
ELSE
SELECT * FROM Original_Content O INNER JOIN Content CO ON O.id=CO.id INNER JOIN (Contributor C INNER JOIN [User] U ON C.id=U.id)
ON CO.contributer_id=C.id AND C.id=@contributor_id WHERE O.filter_status='TRUE' AND O.review_status='TRUE'
END TRY
begin catch
end catch
GO




--procedure number (1)  ##
go



Alter proc Viewer_Create_Event
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
 Alter proc Viewer_Upload_Event_Photo
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
 Alter proc Viewer_Upload_Event_Video 
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
 Alter proc Viewer_Create_Ad_From_Event 
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
ALTER proc Apply_Existing_Request
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
ALTER proc Apply_New_Request
@information varchar (200),
@contributor_id int =null,
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

ALTER proc Delete_New_Request
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
ALTER proc Rating_Original_Content
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
update Original_Content set rating = @average where id = @orignal_content_id
END TRY
begin catch
end catch
end


--procedure number (8)
--Write a comment on the original content using a procedure called ’Write_Comment @comment_text,
--@viewer_id, @original_content_id, @written_time’.

go
ALTER proc Write_Comment
@comment_text varchar (500),
@viewer_id int ,
@original_content_id int ,
@written_time smalldatetime
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
ALTER proc Edit_Comment
@comment_text varchar (500), 
@viewer_id int,
@original_content_id int, 
@last_written_time smalldatetime, 
@updated_written_time smalldatetime
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
ALTER proc Delete_Comment
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
ALTER proc Create_Ads
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
ALTER proc Edit_Ad
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
ALTER proc Delete_Ads
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
ALTER proc Send_Message
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
ALTER proc Show_Message
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
ALTER proc Highest_Rating_Original_content
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
ALTER proc Assign_New_Request 
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
------------------------------------------------------------------------------------------------
--added procedures..
------------------------------------------------------------------------------------------------
--(1)get the last added advertisement.
create proc ad_id
@id int output
as
begin
select @id=IDENT_CURRENT('advertisement')
end


go
--((2)uploading ads photos.)
 create proc Viewer_Upload_ad_Photo
 @ad_id int ,
 @link varchar (100)
 as
 BEGIN TRY
 begin
 insert into ads_photos_link values(@ad_id ,@link)
 end
END TRY
begin catch
end catch
go
--(3) uploading ads videos
create proc Viewer_Upload_ad_vedio
 @ad_id int ,
 @link varchar (100)
 as
 BEGIN TRY
 begin
 insert into ads_video_link values(@ad_id ,@link)
 end
END TRY
begin catch
end catch
