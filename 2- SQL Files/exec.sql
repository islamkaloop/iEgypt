EXEC Original_Content_Search 'images' ,'Educational'

exec Contributor_Search 'mohamed sabry hassen'

DECLARE @user_id INT
EXEC  Register_User 'Content Manager', 'ISLAM1525@GMAIL.COM', 'DD','SALAH','MOHAMED',
'RASHID','1/1/2001',NULL,NULL,
NULL, NULL,NULL, NULL,'5/5/2000',5,150.0, @user_id OUTPUT
PRINT @user_id

EXEC Check_Type 'LOGOS',22

EXEC Order_Contributor

EXEC Show_Original_Content 5

DECLARE @USER INT
EXEC User_login 'mohamedsabry@gmail.com','msh12345',@USER OUTPUT
PRINT @USER

DECLARE @email VARCHAR(50)
DECLARE @password VARCHAR(50) 
DECLARE @firstname VARCHAR(20) 
DECLARE @middlename VARCHAR(20) 
DECLARE @lastname VARCHAR(20)
DECLARE @birth_date DATE 
DECLARE @working_place_name VARCHAR(30) 
DECLARE @working_place_type VARCHAR(20) 
DECLARE @wokring_place_description VARCHAR(300) 
DECLARE @specilization VARCHAR(100) 
DECLARE @portofolio_link VARCHAR(50) 
DECLARE @years_experience INT 
DECLARE @hire_date DATE  
DECLARE @working_hours INT 
DECLARE @payment_rate DECIMAL (10, 2) 
EXEC Show_Profile 13,@email OUTPUT,@password OUTPUT, @firstname OUTPUT,@middlename OUTPUT, 
@lastname OUTPUT,@birth_date OUTPUT,@working_place_name OUTPUT,@working_place_type OUTPUT, 
@wokring_place_description OUTPUT,@specilization OUTPUT,@portofolio_link OUTPUT, 
@years_experience OUTPUT,@hire_date OUTPUT,@working_hours OUTPUT,@payment_rate OUTPUT
PRINT @email  PRINT @password PRINT @firstname PRINT @middlename PRINT @lastname PRINT @birth_date
PRINT @working_place_name PRINT @working_place_type PRINT @wokring_place_description PRINT @specilization
PRINT @portofolio_link PRINT @years_experience PRINT @hire_date PRINT @working_hours PRINT @payment_rate


EXEC Edit_Profile 9 , 'MOSALAH@GMAIL.COM', 'MS1245', 'MOHAMED','SALAH','GHALY','1/1/1970','CIB',
'Banks','The biggest private sector bank in Egypt.','directors',
'https://drive.google.com/drive/folders/77',4, '5/5/2000',
6, 10.2

EXEC Deactivate_Profile 1

EXEC Show_Event 1
EXEC Show_Event NULL

EXEC Show_Notification 8

EXEC Show_New_Content 2,6

declare @outputid int
exec Viewer_Create_Event @city='cairo',@event_date_time ='1/1/2001',@description='balabizo',@entartainer='sfd',@viewer_id=3,@location='fsdsf',@event_id= @outputid out
print @outputid

exec Viewer_Upload_Event_Photo 3, 'www.google.com'

exec Viewer_Upload_Event_Video 1, 'www.google.com'

exec Viewer_Create_Ad_From_Event 1

exec Apply_Existing_Request 1 ,2

exec Apply_New_Request 'hjgyj',5,3 

exec Delete_New_Request 2

exec Rating_Original_Content 2,5,3

exec  Write_Comment 'fafasafaf',1,1,'1/1/2018'

exec Edit_Comment 'abdoooo',1,1,'1/1/2018','1/1/2019'

exec Delete_Comment 1,1,'1/1/2019'

exec Create_Ads 1,'this is an advetizement','cairo'

exec Edit_Ad 2 ,'this', 'cai'

exec Delete_Ads 1

exec Send_Message 'fff',1,5,1,'1/1/2001'

exec Show_Message 5

exec Highest_Rating_Original_content 

exec Assign_New_Request 17,5

exec Receive_New_Requests 9, 1 

declare @can_receive bit 
exec Receive_New_Request 1,@can_receive  OUTPUT
print(@can_receive)

exec Respond_New_Request 4 , 1, 9
  
exec Upload_Original_Content 'images' ,'highschools','educational',5 ,'7mada.com'

exec Upload_New_Content 1,  4, 'highschools','educational', 'datato.com'
 
exec Delete_Content 1 

exec Reviewer_Filter_Content 12,13,0  ;

exec content_manager_filter_content 1,1,0;

exec Staff_Create_Category 'ahmed';

exec Staff_Create_Subcategory 'balala','balala2';

exec Staff_Create_Type'music';

exec Most_Requested_Content;

exec Workingplace_Category_Relation

exec Delete_Comment 10,3,'2/1/2018';

exec Delete_Original_Content 1;

exec Delete_New_Content 1;

exec Assign_Contributor_Request 23 ,5;

exec Show_Possible_Contributors