Create table state (
    State_abbr char(2) primary key,
    State_Name varchar(50) not null,
    State_Instate Boolean not null
);
Create table city (
    City_ID INT(100) auto_increment primary key,
    City_name varchar(100) not null
);
Create table Ctype (
    Ct_Code char(1) not null,
    Ct_Desc Varchar(100) not null,
    Ct_Instate boolean not null,
    Primary key (Ct_code)
);
Create table Grade (
    Grade_abbr char(1) not null,
    Grade_Desc Varchar(20) not null,
    Grade_pass boolean not null, 
    primary key (grade_abbr)
);
Create table Term (
    Term_Code int(3) primary key,
    Term_desc varchar(20) not null
);
Create table Year (
    Yr_year Int(4) not null,
    primary key (Yr_year)
);
Create table subject (
    Sub_abbr char(3) not null,
    Sub_desc varchar(20) not null,
    primary key (Sub_abbr)
);
Create table Standing (
    St_Standing varchar(10) primary key,
    St_Min int(2) not null
);
Create table Student (
    Stu_Tnumber char(9) primary key,
    Stu_Lname varchar(20) not null,
    Stu_Fname varchar(20) not null,
    Stu_Suffix varchar(5)
);
Create table Zipcode (
    Zip_Code char(10) primary key,
    State_Abbr char(2) not null,
    City_ID int not null,
    Foreign key (State_Abbr) references State(State_Abbr),
    foreign key (City_ID) references City(City_ID)
);
Create table course (
    Crs_ID int primary key auto_increment,
    Crs_Number int(3) not null,
    Sub_Abbr char(3) not null, 
    Crs_hours int(3) not null, 
    Crs_Name varchar(40) not null,
    Foreign key (Sub_Abbr) references subject (Sub_Abbr)
);

Create table Address (
    Add_ID int primary key auto_increment,
    Stu_Tnumber char(9) not null, 
    Add_Num varchar(20) not null, 
    Add_Street varchar(30) not null,
    Zip_Code char(10) not null, 
    Add_Street2 varchar(30), 
    Add_PO varchar(20),
    CT_Code char(1) not null, 
    Foreign key (Stu_Tnumber) references Student(Stu_Tnumber),
    Foreign key (Zip_Code) references Zipcode(Zip_Code),
    Foreign key (CT_Code) references Ctype(CT_Code)
);
Create table Phone (
    Ph_ID int primary key auto_increment, 
    Stu_Tnumber char(9) not null, 
    Ph_Number char(15) not null, 
    Ct_Code char(1) not null, 
    Foreign key (Stu_Tnumber) references student(Stu_Tnumber),
    foreign key (Ct_Code) references Ctype(Ct_Code)
);
Create table Completion (
    Com_ID int primary key auto_increment,
    Stu_Tnumber char(9) not null,
    Crs_ID int not null, 
    Trm_Code int(3) not null,
    Yr_year Int(4) not null,
    Grade_abbr char(1) not null,
    Foreign key (Crs_ID) references course(Crs_ID),
    Foreign key (Stu_Tnumber) references Student(Stu_Tnumber),
    foreign key (Trm_Code) references Term(Trm_Code),
    foreign key (Yr_Year) references Year(Yr_Year),
    foreign key (Grade_abbr) references Grade(Grade_abbr)
);

Create table credential (
    cred_id int auto_increment,
    cred_title varchar(100) not null,
    Yr_Year int(4),
    primary key (cred_id),
    foreign key (Yr_Year) references Year (Yr_Year)
);

create table requirement (
    req_id int auto_increment,
    Crs_ID int not null,
    cred_id int not null,
    primary key (req_id),
    foreign key (Crs_ID) references course (Crs_ID),
    foreign key (cred_id) references credential (cred_id)
);

create table fulfillment (
    ful_id int auto_increment,
    Com_ID int not null, 
    req_id int not null,
    primary key (ful_id),
    foreign key (Com_ID) references Completion (Com_ID),
    foreign key (req_id) references requirement (req_id)
);

create table graduation (
    grad_id int auto_increment,
    Stu_Tnumber char(9) not null,
    cred_id int not null, 
    Yr_Year int(4) not null,
    primary key (grad_id),
    foreign key (Stu_Tnumber) references student (Stu_Tnumber),
    foreign key (cred_id) references credential (cred_id),
    foreign key (Yr_Year) references Year (Yr_Year)
);