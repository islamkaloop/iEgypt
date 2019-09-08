
create table [User](
id int primary key identity not null,
email varchar(60),
first_name VARCHAR(20) not null,
middle_name VARCHAR(20) not null,
last_name VARCHAR(20),
birth_date datetime not null,
age as  (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date)),
password varchar(20) not null,
login_date date not null,
active bit
) 

create table Viewer(
id int  primary key not null,
working_place varchar(30)not null,
working_place_type VARCHAR(20) not null,
working_place_decribtion VARCHAR(300)not null,
foreign key(id) references [user] on delete cascade)

create table Notified_Person(
id int primary key not null)

create table Contributor(
id int  primary key not null,
years_of_experience int ,
portfolio_link VARCHAR(100) not null,
specialization VARCHAR(30)not null,
notified_id int ,
foreign key(id) references [user](id) on delete cascade,
foreign key(notified_id) references Notified_Person(id) on delete cascade)

create table Staff(
id int  primary key not null,
hire_date datetime  not null,
working_hours int not null,
payment_rate decimal(10,2)not null,
total_salary as (working_hours*payment_rate) ,
notified_id int ,
foreign key(id) references [User](id) on delete cascade,
foreign key(notified_id) references Notified_Person(id) on delete cascade)

create table Category(
type varchar(20) primary key not null ,
description varchar(200) )

create table Sub_category(
category_type varchar(20) not null ,
name varchar(20) not null,
primary key (category_type, name),
foreign key (category_type) references Category(type) on delete cascade)

create table Content_Type(
type varchar(20) primary key not null )

create table Notification_Object(    --
id int  primary key identity not null )

create table Content_Manager(
id int  primary key not null,
type varchar(20)  null,
foreign key(id) references Staff(id) on delete cascade,
foreign key(type) references Content_type(type) on delete cascade)

create table Reviewer(
id int  primary key not null,
foreign key (id) references Staff(id) on delete cascade ) -- identity or not ?

create table Message(
sent_at DATETIME not null,
contributer_id int not null,
viewer_id int not null,
sender_type bit not null,
read_at datetime ,
text varchar(500)not null,
read_status bit not null,
primary key (sent_at,contributer_id,viewer_id,sender_type),
foreign key (contributer_id) references Contributor(id) on delete cascade,
foreign key (viewer_id) references Viewer(id) )

create table Content(
id int  primary key identity not null,
link VARCHAR(100) not null,
uploaded_at DATETIME,
contributer_id int ,
category_type varchar(20),
subcategory_name varchar(20),
type varchar(20)
foreign key(contributer_id) references contributor(id) on delete cascade,
foreign key(type) references Content_type(type) on delete cascade,
foreign key(category_type,subcategory_name) references Sub_category(category_type,name))

create table Original_Content(
id int primary key ,
content_manager_id int  ,
reviewer_id int  ,
review_status bit default 0 ,
filter_status bit default 0 ,
rating decimal(3,2),
foreign key(id) references Content(id) on delete cascade, -- IC edited
foreign key(reviewer_id) references Reviewer(id),
foreign key(content_manager_id) references Content_Manager(id))

create table Existing_Request(
id int  primary key identity not null,
original_content_id int  ,
viewer_id int not null,
foreign key(original_content_id) references Original_Content(id) ,
foreign key(viewer_id) references viewer(id) on delete cascade)


create table New_Request(
id int primary key identity not null ,
accept_status bit ,
specified bit not null,
information varchar(200) not null,
viewer_id int not null,
notif_obj_id int not null,
contributer_id int ,
foreign key (contributer_id) references Contributor(id) on delete cascade,
foreign key (viewer_id) references Viewer(id),
foreign key (notif_obj_id) references Notification_Object(id))

create table New_Content(
id int primary key,
new_request_id int ,
upload date ,
foreign key (id) references content(id) on delete cascade,
foreign key (new_request_id) references new_request(id))

create table comment(
Viewer_id int,
original_content_id int,
date datetime,
text varchar(500),
primary key(viewer_id,original_content_id,date),
foreign key (viewer_id) references viewer(id),
foreign key (original_content_id) references original_content(id))

create table rate(
Viewer_id int,
original_content_id int,
date datetime,
rate int,
primary key(viewer_id,original_content_id),
foreign key (viewer_id) references viewer(id),
foreign key (original_content_id) references original_content(id),
check (rate between 0 and 5))

create table event(
id int primary key identity,
description varchar(200),
location varchar(30),
city varchar(20),
time datetime,
entertainer varchar(40),
notification_object_id int ,
viewer_id int ,
foreign key (viewer_id) references viewer(id),
foreign key (notification_object_id) references notification_object(id))

create table event_photos_link(
event_id int ,
link varchar(100)
primary key(event_id,link),
foreign key (event_id) references event(id)on delete cascade
)

create table event_videos_link(
event_id int ,
link varchar(100)
primary key(event_id,link),
foreign key (event_id) references event(id)on delete cascade
)

create table advertisement(
id int primary key identity,
descripition varchar(200) ,
location varchar(20) ,
event_id int ,
viewer_id int,
foreign key (viewer_id) references viewer(id),
foreign key (event_id) references event(id))


create table ads_video_link(
advertisement_id int ,
link varchar(100),
primary key(advertisement_id,link),
foreign key (advertisement_id) references advertisement(id) on delete cascade
)

create table ads_photos_link(
advertisement_id int ,
link varchar(100),
primary key(advertisement_id,link),
foreign key (advertisement_id) references advertisement(id)on delete cascade
)

create table announcement(
id int primary key identity,
seen_at datetime,
sent_at datetime,
notified_person_id int ,
notification_object_id int,
foreign key (notified_person_id) references notified_person(id),
foreign key (notification_object_id) references notification_object(id))
