
CREATE DATABASE Friends_Fb;
USE Friends_Fb;


DROP TABLE IF EXISTS Fb_friend;

CREATE TABLE Fb_friend 
(F_id INT, 
F_name varchar(255) NOT NULL, 
L_name Varchar(255) NOT NULL,
 Nick_Name varchar(255) NOT NULL, 
 Date_of_Birth datetime, 
 Permanent_address Varchar(255) NOT NULL, 
 Present_address varchar(255) NOT NULL,
 Study varchar(255) NOT NULL,
 Occupation Varchar(255) NOT NULL,
 Contact INT(55) NOT NULL,
 Blood_Group varchar(11)
 #Created_at TIMESTAMP DEFAULT NOW()

);


INSERT INTO Fb_friend VALUES
(01,'Mahmudul', 'Hasan', 'Opu', '1989-02-19', 'Kishoreganj', 'Dhaka','SUST', 'Reneta Limited', '0161288744','NF'),
(02,'Nayma', 'Khanam', 'Joni', '00-00-00', ' Kishoreganj', 'Kishoreganj','Eden College','Assistant Teacher', '01950175185', 'NF'),
(03,'Shafique', 'Islam', 'Shafiq', '00-00-00', 'Kishoreganj', 'Kishoreganj','Gurudayal College', 'Bank', '01913557595', 'NF'),
(04,'Shakhawat', 'Hussain', 'Shakhawat', '00-00-00', 'Kishoreganj', 'Kishoreganj','NU', 'Ascet Development', '01913753099', 'NF'),
(05,'Shafiqul', 'Islam', 'Shafiq', '00-00-00', 'Kishoreganj', 'Dhaka','NU', 'Rupali Bank', '00000', 'NF'),
(06,'Ferdous', 'Ara', 'Tania', '00-00-00', 'Kishoreganj', 'Japan','SUST', 'PhD Student', '00000', 'NF'),
(07,'Rakeb', 'Mazharul Islam', 'Rakeb', '00-00-00', 'Kishoreganj', 'USA','BUET', 'PhD', '00000', 'NF'),
(08,'Rigan', 'Ahmad', 'Takashi', '00-00-00', 'Kishoreganj', 'Kishoreganj','BUET', 'Berger Paints', '01674299427', 'NF'),
(09,'Aminul', 'Islam', 'Shabuj', '00-00-00', 'Kishoreganj', 'Pabna','SUST', 'Nuclear Power Plant', '00000', 'NF'),
(10,'Deen', 'Islam', 'Mithu', '1989-12-28', 'Kishoreganj', 'Kishoreganj','Community Based Medical College', 'Dr.', '01719183524', 'NF'),
(11,'Sabrina', 'Matra', 'Sabrina', '00-00-00', 'Kishoreganj', 'Dhaka', 'State University','Labaid', '00000', 'NF'),
(12,'Mkh', 'Ohi', 'Ohi', '00-00-00', 'Kishoreganj', 'Dhaka', 'DU','Pragati Footwear','00000', 'NF'),
(13,'Shahin', 'Islam', 'Shahin', '00-00-00', 'Kishoreganj', 'Kishoreganj','NU', 'Navee', '01845841856', 'NF'),
(14,'Mazharul', 'Islam', 'Lingkon', '00-00-00', 'Kishoreganj', 'Kishoreganj', 'DU', 'ASP', '01921741758', 'NF'),
(15,'Deen', 'Mohammad', 'Deepo', '00-00-00', 'Sunamganj', 'Korea','SAU','PhD', '00000', 'NF'),
(16,'Adv Sharif', 'Ahmed', 'Sharif', '00-00-00', 'Mymensingh', 'Dhaka','Southeast', 'Jodge Court', '01619446150', 'NF'),
(17,'Habib', 'Rahman', 'Habib', '00-00-00', 'Kishoreganj', 'Kishoreganj','SUST', 'Aristovision Ltd', '00000', 'NF'),
(18,'M.K.', 'Hasan', 'Hasan', '00-00-00', 'Kishoreganj', 'Dhaka', 'SUST','Adamjee Cant', '00000', 'NF'),
(19,'C S Rubel', 'Ahammaed', 'Rubel', '00-00-00', 'Kishoreganj', 'Kishoreganj', 'NU','Bank', '00000', 'NF'),
(20,'Ahmed', 'Himed', 'Himel', '00-00-00', 'Kishoreganj', 'Kishoreganj','JNU', 'Bank', '01723124780', 'NF'),
(21,'Proloy ', 'Ghosh', 'Proloy', '00-00-00', 'Kishoreganj', 'Mymensingh','Community Based Medical College', 'Dr.', '00000', 'NF'),
(22,'Rasel ', 'Analysis', 'Rasel', '00-00-00', 'Kishoreganj', 'Kishoreganj', 'NU','Tutor', '00000', 'NF'),
(23,'GK ', 'Tofayel', 'Tofayel', '00-00-00', 'Kishoreganj', 'Sylhet','NU', 'Teacher', '00000', 'NF'),
(24,'Reyad', 'Chowdhury', 'Reyad', '00-00-00', 'Kishoreganj', 'Dhaka','Dhaka College','Globe', '00000', 'NF'),
(25,'Majharul ', 'Royhan', 'Royhan', '00-00-00', 'Kishoreganj', 'Dhaka','DU', 'ASDA', '00000', 'NF'),
(26,'Kumudini ', 'Kumu', 'Kumkum', '00-00-00', 'Kishoreganj', 'Natore', 'NU','PBS-2', '00000', 'NF'),
(27,'Sanaullah', 'Ahsan', 'Ahsan', '00-00-00', 'Kishoreganj', 'Kishoreganj', 'NU','Teacher', '00000', 'NF'),
(28,'Faisal', 'Shibley', 'Shibley', '00-00-00', 'Dhaka', 'Canada', 'North South University','MPI', '00000', 'NF'),
(29,'Razia', 'Suntana', 'Dipa', '00-00-00', 'Dhaka', 'Canada', 'BAU','UofM', '00000', 'NF'),
(30,'Sakib', 'Rahman', 'Sakib', '00-00-00', 'Khulna', 'Canada', 'UofM','PhD', '00000', 'NF'),
(31,'Rubel', 'Talukder', 'Rubel', '00-00-00', 'Sunamganj', 'Canada', 'UofM','PhD', '00000', 'NF'),
(32,'Tanvir', 'Ahmed', 'Tanvir', '00-00-00', 'Mymensingh', 'Mymensingh', 'JNU','Krishi Bank', '00000', 'NF'),
(33,'Bhupen', 'Kishore', 'Bhupen', '00-00-00', 'Comilla', 'Dhaka', 'SUST','Unemployed', '00000', 'NF'),
(34,'MOnjurul', 'Islam', 'Rasel', '00-00-00', 'Dhaka', 'Dhaka', 'BUET','Software developer', '00000', 'NF'),
(35,'Jahid', 'Hasan', 'Jahid', '00-00-00', 'Pabna', 'Canada', 'UofM','MSc', '00000', 'NF'),
(36,'Mostarina', 'Bizlee', 'Mostarina', '00-00-00', 'Dhaka', 'Canada', 'BAU','24-7 Intouch', '00000', 'NF')

;
SELECT*FROM Fb_friend;

