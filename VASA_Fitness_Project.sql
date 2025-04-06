------------------------------------------------------------------------ 
-- VASA Fitness database  
-- Group 12 IS 6420
------------------------------------------------------------------------




create schema if not exists vasa_fitness;
set schema 'vasa_fitness'; 


-- drop tables if they already exist
drop table if exists media;
drop table if exists exercise;
drop table if exists equipment;
drop table if exists amenity;
drop table if exists my_appointment;
drop table if exists class;
drop table if exists employee;
drop table if exists checkin_history;
drop table if exists achievement;
drop table if exists payment;
drop table if exists membership_plan;
drop table if exists gym_member;
drop table if exists gym;

-- create table for gym member
create table gym_member (
    member_id int primary key,
    member_first_name varchar(100) not null,
    member_last_name varchar(100) not null,
    member_email varchar(100) not null,
    member_phone_number char(10) ,
    member_street_address varchar(100) not null,
    member_city varchar(100) not null,
    member_state varchar(100) not null,
    member_zipcode char(5) not null
);

-- create table for membership plan
create table membership_plan (
    plan_id int primary key,
    plan_name varchar(100) not null,
    enrollment_date_start date not null,
    enrollment_date_end date,
    plan_cost money not null,
    amenity_limitation varchar(100) not null,
    class_limitation varchar(100) not null,
    guest_pass boolean not null,
    account_status boolean not null,
    member_id int,
    foreign key (member_id) references gym_member(member_id)
);

-- create table for payment
create table payment (
    payment_id int primary key,
    payment_date date not null,
    amount money not null,
    method varchar(100) not null,
    plan_id int not null,
    foreign key (plan_id) references membership_plan(plan_id)
);

-- create table for gym
create table gym (
    gym_id int primary key,
    gym_name varchar(100) not null,
    gym_street_address varchar(100) not null,
    gym_city varchar(100) not null,
    gym_state varchar(100) not null,
    gym_zipcode char(5) not null,
    gym_opening_hours varchar(100) not null
);

-- create table for achievement
create table achievement (
    achievement_id int primary key,
    achievement_type varchar(100) not null,
    earned_date date not null,
    member_id int,
    foreign key (member_id) references gym_member(member_id)
);

-- create table for check-in history
create table checkin_history (
    checkin_id int primary key,
    checkin_time time not null,
    checkin_date date not null,
    gym_id int ,
    foreign key (gym_id) references gym(gym_id)
);

-- create table for employee
create table employee (
    employee_id int primary key,
    employee_name varchar(100) not null
);

-- create table for class
create table class (
    class_id int primary key,
    class_name varchar(100) not null,
    class_date date not null,
    class_time time not null,
    class_room_number int not null,
    gym_id int,
    instructor_id int,
    foreign key (instructor_id) references employee(employee_id),
    foreign key (gym_id) references gym(gym_id)
);

-- create table for my appointment
create table my_appointment (
    appointment_id int primary key,
    appointment_date date not null,
    appointment_time time not null,
    activity_name varchar(100) not null,
    member_id int ,
    employee_id int,
    foreign key (member_id) references gym_member(member_id),
    foreign key (employee_id) references employee(employee_id)
);

-- create table for amenity
create table amenity (
    amenity_id int primary key,
    amenity_name varchar(100) not null,
    amenity_availability boolean not null,
    gym_id int,
    foreign key (gym_id) references gym(gym_id)
);

-- create table for equipment
create table equipment (
    equipment_id int primary key,
    equipment_name varchar(100)not null,
    location varchar(100),
    condition varchar(100),
    description varchar(100),
    gym_id int,
    foreign key (gym_id) references gym(gym_id)
);

-- create table for exercise
create table exercise (
    exercise_id int primary key,
    focus_areas varchar(100) not null,
    exercise_level varchar(100) not null,
    equipment_id int,
    foreign key (equipment_id) references equipment(equipment_id)
);

-- create table for media
create table media (
    media_id int primary key,
    exercise_id int,
    format varchar(100) not null,
    source varchar(100) not null,
    foreign key (exercise_id) references exercise(exercise_id)
);



INSERT INTO gym_member (member_id, member_first_name, member_last_name, member_email, member_phone_number, member_street_address, member_city, member_state, member_zipcode)
VALUES
(1, 'John', 'Doe', 'johndoe1@example.com', '8011234567', '123 Fitness St', 'Salt Lake City', 'UT', '84101'),
(2, 'Jane', 'Smith', 'janesmith2@example.com', '8012345678', '456 Workout Ave', 'Provo', 'UT', '84601'),
(3, 'Sam', 'Johnson', 'samjohnson3@example.com', '8013456789', '789 Gym Rd', 'Ogden', 'UT', '84401'),
(4, 'Mike', 'Brown', 'mikebrown4@example.com', '8014567890', '101 Healthy Way', 'Layton', 'UT', '84041'),
(5, 'Emily', 'Davis', 'emilydavis5@example.com', '8015678901', '202 Fit Ln', 'Lehi', 'UT', '84043'),
(6, 'Chris', 'Miller', 'chrismiller6@example.com', '8016789012', '303 Strong Blvd', 'Sandy', 'UT', '84070'),
(7, 'Patricia', 'Wilson', 'patriciawilson7@example.com', '8017890123', '404 Strength Ave', 'Orem', 'UT', '84058'),
(8, 'Robert', 'Anderson', 'robertanderson8@example.com', '8018901234', '505 Muscle St', 'West Jordan', 'UT', '84084'),
(9, 'Linda', 'Thomas', 'lindathomas9@example.com', '8019012345', '606 Endurance Dr', 'Taylorsville', 'UT', '84129'),
(10, 'James', 'Moore', 'jamesmoore10@example.com', '8010123456', '707 Speed Ave', 'Murray', 'UT', '84123'),
(11, 'Sarah', 'Taylor', 'sarahtaylor11@example.com', '8011112233', '808 Power Rd', 'Draper', 'UT', '84020'),
(12, 'David', 'Lee', 'davidlee12@example.com', '8011223344', '909 Workout Ln', 'Herriman', 'UT', '84096'),
(13, 'Barbara', 'White', 'barbarawhite13@example.com', '8011334455', '1010 Energy Cir', 'Kaysville', 'UT', '84037'),
(14, 'Michael', 'Harris', 'michaelharris14@example.com', '8011445566', '1111 Pushup Dr', 'Farmington', 'UT', '84025'),
(15, 'Jessica', 'Clark', 'jessicaclark15@example.com', '8011556677', '1212 Cardio Ln', 'Bountiful', 'UT', '84010'),
(16, 'Daniel', 'Lewis', 'daniellewis16@example.com', '8011667788', '1313 Sprint Ave', 'Centerville', 'UT', '84014'),
(17, 'Karen', 'Walker', 'karenwalker17@example.com', '8011778899', '1414 Marathon Blvd', 'Park City', 'UT', '84060'),
(18, 'Joseph', 'Hall', 'josephhall18@example.com', '8011889900', '1515 Circuit Cir', 'Heber', 'UT', '84032'),
(19, 'Nancy', 'Allen', 'nancyallen19@example.com', '8011990011', '1616 Muscle Ln', 'Midvale', 'UT', '84047'),
(20, 'Steven', 'Young', 'stevenyoung20@example.com', '8012001122', '1717 Fitness St', 'Holladay', 'UT', '84117'),
(21, 'Donna', 'King', 'donnaking21@example.com', '8012112233', '1818 Benchpress Blvd', 'Cottonwood Heights', 'UT', '84121'),
(22, 'Paul', 'Scott', 'paulscott22@example.com', '8012223344', '1919 Treadmill Ave', 'Bluffdale', 'UT', '84065'),
(23, 'Mary', 'Green', 'marygreen23@example.com', '8012334455', '2020 Rowing Cir', 'Eagle Mountain', 'UT', '84005'),
(24, 'Richard', 'Baker', 'richardbaker24@example.com', '8012445566', '2121 Deadlift Dr', 'Saratoga Springs', 'UT', '84045'),
(25, 'Betty', 'Nelson', 'bettynelson25@example.com', '8012556677', '2222 Squat Ln', 'Tooele', 'UT', '84074'),
(26, 'Charles', 'Carter', 'charlescarter26@example.com', '8012667788', '2323 Flex Blvd', 'St. George', 'UT', '84770'),
(27, 'Megan', 'Mitchell', 'meganmitchell27@example.com', '8012778899', '2424 Strength Ave', 'Logan', 'UT', '84321'),
(28, 'Larry', 'Perez', 'larryperez28@example.com', '8012889900', '2525 Energy Rd', 'Moab', 'UT', '84532'),
(29, 'Sandra', 'Roberts', 'sandraroberts29@example.com', '8012990011', '2626 Speed Cir', 'Price', 'UT', '84501'),
(30, 'Mark', 'Phillips', 'markphillips30@example.com', '8013001122', '2727 Stamina St', 'Brigham City', 'UT', '84302'),
(31, 'Laura', 'Campbell', 'lauracampbell31@example.com', '8013112233', '2828 Pushup Ln', 'Tremonton', 'UT', '84337'),
(32, 'Kevin', 'Parker', 'kevinparker32@example.com', '8013223344', '2929 Workout Ave', 'Nephi', 'UT', '84648'),
(33, 'Elizabeth', 'Evans', 'elizabethevans33@example.com', '8013334455', '3030 Cardio Blvd', 'Payson', 'UT', '84651'),
(34, 'Brian', 'Edwards', 'brianedwards34@example.com', '8013445566', '3131 Marathon Dr', 'Spanish Fork', 'UT', '84660'),
(35, 'Angela', 'Collins', 'angelacollins35@example.com', '8013556677', '3232 Flex Cir', 'Springville', 'UT', '84663'),
(36, 'Joshua', 'Stewart', 'joshuastewart36@example.com', '8013667788', '3333 Gym Rd', 'Mapleton', 'UT', '84664'),
(37, 'Katherine', 'Sanchez', 'katherinesanchez37@example.com', '8013778899', '3434 Strength Ln', 'Genola', 'UT', '84655'),
(38, 'Anthony', 'Morris', 'anthonymorris38@example.com', '8013889900', '3535 Endurance Ave', 'Lindon', 'UT', '84042'),
(39, 'Sophia', 'Rogers', 'sophiarogers39@example.com', '8013990011', '3636 Muscle Blvd', 'American Fork', 'UT', '84003'),
(40, 'Benjamin', 'Reed', 'benjaminreed40@example.com', '8014001122', '3737 Fitness Dr', 'Alpine', 'UT', '84004'),
(41, 'Pamela', 'Cook', 'pamelacook41@example.com', '8014112233', '3838 Benchpress St', 'Pleasant Grove', 'UT', '84062'),
(42, 'Ryan', 'Morgan', 'ryanmorgan42@example.com', '8014223344', '3939 Treadmill Cir', 'Cedar Hills', 'UT', '84062'),
(43, 'Kimberly', 'Bell', 'kimberlybell43@example.com', '8014334455', '4040 Circuit Rd', 'Salem', 'UT', '84653'),
(44, 'Nicholas', 'Murphy', 'nicholasmurphy44@example.com', '8014445566', '4141 Workout Ave', 'Santaquin', 'UT', '84655'),
(45, 'Patricia', 'Bailey', 'patriciabailey45@example.com', '8014556677', '4242 Speed Ln', 'Hurricane', 'UT', '84737'),
(46, 'George', 'Rivera', 'georgerivera46@example.com', '8014667788', '4343 Stamina Blvd', 'Ivins', 'UT', '84738'),
(47, 'Ashley', 'Cooper', 'ashleycooper47@example.com', '8014778899', '4444 Flex St', 'Washington', 'UT', '84780'),
(48, 'Richard', 'Richardson', 'richardrichardson48@example.com', '8014889900', '4545 Muscle Cir', 'Kanab', 'UT', '84741'),
(49, 'Emily', 'Cox', 'emilycox49@example.com', '8014990011', '4646 Energy Ave', 'Cedar City', 'UT', '84720'),
(50, 'Matthew', 'Ward', 'matthewward50@example.com', '8015001122', '4747 Sprint Ln', 'Vernal', 'UT', '84078');




INSERT INTO membership_plan (plan_id, plan_name, enrollment_date_start, enrollment_date_end, plan_cost, amenity_limitation, class_limitation, guest_pass, account_status, member_id)
VALUES 
(1, 'Basic', '2023-01-01', '2024-01-01', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 1),
(2, 'Standard', '2023-02-01', '2024-02-01', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 2),
(3, 'Premium', '2023-03-01', '2024-03-01', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 3),
(4, 'Basic', '2023-01-15', '2024-01-15', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 4),
(5, 'Standard', '2023-02-15', '2024-02-15', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 5),
(6, 'Premium', '2023-03-15', '2024-03-15', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 6),
(7, 'Basic', '2023-04-01', '2024-04-01', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 7),
(8, 'Standard', '2023-05-01', '2024-05-01', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 8),
(9, 'Premium', '2023-06-01', '2024-06-01', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 9),
(10, 'Basic', '2023-07-01', '2024-07-01', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 10),
(11, 'Standard', '2023-08-01', '2024-08-01', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 11),
(12, 'Premium', '2023-09-01', '2024-09-01', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 12),
(13, 'Basic', '2023-10-01', '2024-10-01', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 13),
(14, 'Standard', '2023-11-01', '2024-11-01', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 14),
(15, 'Premium', '2023-12-01', '2024-12-01', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 15),
(16, 'Basic', '2023-01-10', '2024-01-10', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 16),
(17, 'Standard', '2023-02-10', '2024-02-10', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 17),
(18, 'Premium', '2023-03-10', '2024-03-10', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 18),
(19, 'Basic', '2023-04-10', '2024-04-10', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 19),
(20, 'Standard', '2023-05-10', '2024-05-10', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 20),
(21, 'Premium', '2023-06-10', '2024-06-10', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 21),
(22, 'Basic', '2023-07-10', '2024-07-10', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 22),
(23, 'Standard', '2023-08-10', '2024-08-10', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 23),
(24, 'Premium', '2023-09-10', '2024-09-10', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 24),
(25, 'Basic', '2023-10-10', '2024-10-10', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 25),
(26, 'Standard', '2023-11-10', '2024-11-10', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 26),
(27, 'Premium', '2023-12-10', '2024-12-10', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 27),
(28, 'Basic', '2023-01-20', '2024-01-20', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 28),
(29, 'Standard', '2023-02-20', '2024-02-20', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 29),
(30, 'Premium', '2023-03-20', '2024-03-20', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 30),
(31, 'Basic', '2023-04-20', '2024-04-20', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 31),
(32, 'Standard', '2023-05-20', '2024-05-20', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 32),
(33, 'Premium', '2023-06-20', '2024-06-20', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 33),
(34, 'Basic', '2023-07-20', '2024-07-20', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 34),
(35, 'Standard', '2023-08-20', '2024-08-20', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 35),
(36, 'Premium', '2023-09-20', '2024-09-20', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 36),
(37, 'Basic', '2023-10-20', '2024-10-20', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 37),
(38, 'Standard', '2023-11-20', '2024-11-20', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 38),
(39, 'Premium', '2023-12-20', '2024-12-20', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 39),
(40, 'Basic', '2023-01-25', '2024-01-25', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 40),
(41, 'Standard', '2023-02-25', '2024-02-25', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 41),
(42, 'Premium', '2023-03-25', '2024-03-25', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 42),
(43, 'Basic', '2023-04-25', '2024-04-25', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 43),
(44, 'Standard', '2023-05-25', '2024-05-25', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 44),
(45, 'Premium', '2023-06-25', '2024-06-25', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 45),
(46, 'Basic', '2023-07-25', '2024-07-25', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 46),
(47, 'Standard', '2023-08-25', '2024-08-25', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 47),
(48, 'Premium', '2023-09-25', '2024-09-25', 39.99, 'Access to All', 'Unlimited Group Classes', TRUE, TRUE, 48),
(49, 'Basic', '2023-10-25', '2024-10-25', 19.99, 'No Pool', 'No Group Classes', FALSE, TRUE, 49),
(50, 'Standard', '2023-11-25', '2024-11-25', 29.99, 'No Pool', 'Limited Group Classes', TRUE, TRUE, 50);






-- Inserting data into the payment table
INSERT INTO payment (payment_id, payment_date, amount, method, plan_id)
VALUES 
(1, '2023-01-01', 19.99, 'Credit Card', 1),
(2, '2023-01-15', 29.99, 'Debit Card', 2),
(3, '2023-01-30', 39.99, 'PayPal', 3),
(4, '2023-02-01', 19.99, 'Credit Card', 4),
(5, '2023-02-15', 29.99, 'Debit Card', 5),
(6, '2023-02-28', 39.99, 'PayPal', 6),
(7, '2023-03-01', 19.99, 'Credit Card', 7),
(8, '2023-03-15', 29.99, 'Debit Card', 8),
(9, '2023-03-30', 39.99, 'PayPal', 9),
(10, '2023-04-01', 19.99, 'Credit Card', 10),
(11, '2023-04-15', 29.99, 'Debit Card', 11),
(12, '2023-04-30', 39.99, 'PayPal', 12),
(13, '2023-05-01', 19.99, 'Credit Card', 13),
(14, '2023-05-15', 29.99, 'Debit Card', 14),
(15, '2023-05-30', 39.99, 'PayPal', 15),
(16, '2023-06-01', 19.99, 'Credit Card', 16),
(17, '2023-06-15', 29.99, 'Debit Card', 17),
(18, '2023-06-30', 39.99, 'PayPal', 18),
(19, '2023-07-01', 19.99, 'Credit Card', 19),
(20, '2023-07-15', 29.99, 'Debit Card', 20),
(21, '2023-07-30', 39.99, 'PayPal', 21),
(22, '2023-08-01', 19.99, 'Credit Card', 22),
(23, '2023-08-15', 29.99, 'Debit Card', 23),
(24, '2023-08-30', 39.99, 'PayPal', 24),
(25, '2023-09-01', 19.99, 'Credit Card', 25),
(26, '2023-09-15', 29.99, 'Debit Card', 26),
(27, '2023-09-30', 39.99, 'PayPal', 27),
(28, '2023-10-01', 19.99, 'Credit Card', 28),
(29, '2023-10-15', 29.99, 'Debit Card', 29),
(30, '2023-10-30', 39.99, 'PayPal', 30),
(31, '2023-11-01', 19.99, 'Credit Card', 31),
(32, '2023-11-15', 29.99, 'Debit Card', 32),
(33, '2023-11-30', 39.99, 'PayPal', 33),
(34, '2023-12-01', 19.99, 'Credit Card', 34),
(35, '2023-12-15', 29.99, 'Debit Card', 35),
(36, '2023-12-30', 39.99, 'PayPal', 36),
(37, '2024-01-01', 19.99, 'Credit Card', 37),
(38, '2024-01-15', 29.99, 'Debit Card', 38),
(39, '2024-01-30', 39.99, 'PayPal', 39),
(40, '2024-02-01', 19.99, 'Credit Card', 40),
(41, '2024-02-15', 29.99, 'Debit Card', 41),
(42, '2024-02-28', 39.99, 'PayPal', 42),
(43, '2024-03-01', 19.99, 'Credit Card', 43),
(44, '2024-03-15', 29.99, 'Debit Card', 44),
(45, '2024-03-30', 39.99, 'PayPal', 45),
(46, '2024-04-01', 19.99, 'Credit Card', 46),
(47, '2024-04-15', 29.99, 'Debit Card', 47),
(48, '2024-04-30', 39.99, 'PayPal', 48),
(49, '2024-05-01', 19.99, 'Credit Card', 49),
(50, '2024-05-15', 29.99, 'Debit Card', 50);





INSERT INTO gym (gym_id, gym_name, gym_street_address, gym_city, gym_state, gym_zipcode, gym_opening_hours)
VALUES
(1, 'Salt Lake Fitness', '100 E 100 S', 'Salt Lake City', 'UT', '84111', '05:00 AM - 10:00 PM'),
(2, 'Provo Power Gym', '200 S University Ave', 'Provo', 'UT', '84601', '06:00 AM - 11:00 PM'),
(3, 'Ogden Strength Club', '300 E 25th St', 'Ogden', 'UT', '84401', '05:30 AM - 10:00 PM'),
(4, 'West Jordan Wellness Center', '4000 W 7800 S', 'West Jordan', 'UT', '84084', '06:00 AM - 12:00 AM'),
(5, 'Sandy Health Club', '123 W 9000 S', 'Sandy', 'UT', '84070', '05:00 AM - 11:00 PM'),
(6, 'Layton Active Gym', '700 N 2000 W', 'Layton', 'UT', '84041', '05:30 AM - 10:00 PM'),
(7, 'Lehi Lifestyle Gym', '2000 N 1200 E', 'Lehi', 'UT', '84043', '06:00 AM - 10:00 PM'),
(8, 'Orem Family Fitness', '100 S 800 E', 'Orem', 'UT', '84058', '05:00 AM - 10:00 PM'),
(9, 'Bountiful Fitness Center', '400 W 500 S', 'Bountiful', 'UT', '84010', '06:00 AM - 09:00 PM'),
(10, 'Draper Vitality Gym', '123 E 12300 S', 'Draper', 'UT', '84020', '05:30 AM - 11:30 PM');




INSERT INTO achievement (achievement_id, achievement_type, earned_date, member_id)
VALUES
(1, 'First Check-in', '2024-01-05', 1),
(2, 'Completed 10 Classes', '2024-01-10', 2),
(3, 'Participated in 5 Personal Training Sessions', '2024-01-15', 3),
(4, 'Lost 5 Pounds', '2024-01-20', 4),
(5, 'Achieved 100 Workout Hours', '2024-01-25', 5),
(6, 'First Month Completed', '2024-01-30', 6),
(7, 'Referrals: 2 Friends', '2024-02-05', 7),
(8, 'First Group Class', '2024-02-10', 8),
(9, 'Completed 50 Workouts', '2024-02-15', 9),
(10, 'First Workout Milestone', '2024-02-20', 10),
(11, 'First Personal Training Session', '2024-02-25', 11),
(12, 'Completed 20 Classes', '2024-03-01', 12),
(13, 'Participated in a Fitness Challenge', '2024-03-05', 13),
(14, 'Achieved 50 Pounds Lifted', '2024-03-10', 14),
(15, 'Lost 10 Pounds', '2024-03-15', 15),
(16, 'Completed 100 Classes', '2024-03-20', 16),
(17, 'First Workout at the Gym', '2024-03-25', 17),
(18, 'Completed 30 Days in a Row', '2024-03-30', 18),
(19, 'Achieved 200 Workout Hours', '2024-04-05', 19),
(20, 'First Half Marathon', '2024-04-10', 20),
(21, 'First Year Membership', '2024-04-15', 21),
(22, 'Reached 500 Fitness Points', '2024-04-20', 22),
(23, 'First Yoga Class', '2024-04-25', 23),
(24, 'Lost 15 Pounds', '2024-04-30', 24),
(25, 'Participated in a Competition', '2024-05-05', 25),
(26, 'First Nutrition Plan Completed', '2024-05-10', 26),
(27, 'Completed 15 Personal Training Sessions', '2024-05-15', 27),
(28, 'Participated in a Workshop', '2024-05-20', 28),
(29, 'Achieved 100 Workouts', '2024-05-25', 29),
(30, 'First Fitness Assessment', '2024-05-30', 30),
(31, 'Attended 5 Group Classes', '2024-06-05', 31),
(32, 'Achieved 300 Workout Hours', '2024-06-10', 32),
(33, 'First Weightlifting Class', '2024-06-15', 33),
(34, 'Participated in a Community Event', '2024-06-20', 34),
(35, 'Lost 20 Pounds', '2024-06-25', 35),
(36, 'Achieved 1000 Fitness Points', '2024-06-30', 36),
(37, 'First Spin Class', '2024-07-05', 37),
(38, 'Completed 40 Classes', '2024-07-10', 38),
(39, 'Participated in a Challenge', '2024-07-15', 39),
(40, 'Completed 60 Workouts', '2024-07-20', 40),
(41, 'Achieved 150 Pounds Lifted', '2024-07-25', 41),
(42, 'First Nutrition Workshop', '2024-07-30', 42),
(43, 'Completed 3 Months Membership', '2024-08-05', 43),
(44, 'Attended 10 Group Classes', '2024-08-10', 44),
(45, 'Lost 25 Pounds', '2024-08-15', 45),
(46, 'Achieved 400 Workout Hours', '2024-08-20', 46),
(47, 'First Fitness Class', '2024-08-25', 47),
(48, 'Participated in a Fitness Event', '2024-08-30', 48),
(49, 'Achieved 200 Workouts', '2024-09-05', 49),
(50, 'First Boot Camp Class', '2024-09-10', 50),
(51, 'Completed 2 Years Membership', '2024-09-15', 1),
(52, 'Achieved 600 Fitness Points', '2024-09-20', 2),
(53, 'Participated in a Fitness Retreat', '2024-09-25', 3),
(54, 'First Family Fitness Class', '2024-09-30', 4),
(55, 'Completed 75 Classes', '2024-10-05', 5),
(56, 'Achieved 500 Workout Hours', '2024-10-10', 6),
(57, 'Lost 30 Pounds', '2024-10-15', 7),
(58, 'First Outdoor Workout', '2024-10-20', 8),
(59, 'Achieved 700 Fitness Points', '2024-10-25', 9),
(60, 'First Pilates Class', '2024-10-30', 10),
(61, 'Participated in a Fitness Seminar', '2024-11-05', 11),
(62, 'First Family Workout', '2024-11-10', 12),
(63, 'Achieved 50 Classes', '2024-11-15', 13),
(64, 'Lost 35 Pounds', '2024-11-20', 14),
(65, 'Completed 90 Days in a Row', '2024-11-25', 15),
(66, 'First Zumba Class', '2024-11-30', 16),
(67, 'Achieved 800 Workout Hours', '2024-12-05', 17),
(68, 'Participated in a Charity Event', '2024-12-10', 18),
(69, 'Completed 50 Personal Training Sessions', '2024-12-15', 19),
(70, 'Lost 40 Pounds', '2024-12-20', 20),
(71, 'Achieved 900 Fitness Points', '2024-12-25', 21),
(72, 'First Kickboxing Class', '2024-12-30', 22),
(73, 'Completed 10 Challenges', '2025-01-05', 23),
(74, 'First Weight Loss Challenge', '2025-01-10', 24),
(75, 'Participated in a Fitness Program', '2025-01-15', 25),
(76, 'Achieved 1000 Workout Hours', '2025-01-20', 26),
(77, 'First CrossFit Class', '2025-01-25', 27),
(78, 'Lost 45 Pounds', '2025-01-30', 28),
(79, 'Completed 5 Fitness Programs', '2025-02-05', 29),
(80, 'Achieved 1100 Fitness Points', '2025-02-10', 30),
(81, 'First Circuit Training Class', '2025-02-15', 31),
(82, 'Participated in a Local Competition', '2025-02-20', 32),
(83, 'Completed 3 Months of Personal Training', '2025-02-25', 33),
(84, 'Achieved 1200 Workout Hours', '2025-03-02', 34),
(85, 'Lost 50 Pounds', '2025-03-07', 35),
(86, 'First Triathlon Completed', '2025-03-12', 36),
(87, 'Participated in a Group Run', '2025-03-17', 37),
(88, 'Achieved 1300 Fitness Points', '2025-03-22', 38),
(89, 'First Meditation Class', '2025-03-27', 39),
(90, 'Lost 55 Pounds', '2025-04-01', 40),
(91, 'Completed 100 Classes', '2025-04-06', 41),
(92, 'Achieved 1400 Workout Hours', '2025-04-11', 42),
(93, 'First Dance Class', '2025-04-16', 43),
(94, 'Participated in a Group Challenge', '2025-04-21', 44),
(95, 'Achieved 1500 Fitness Points', '2025-04-26', 45),
(96, 'First Team Workout', '2025-05-01', 46),
(97, 'Lost 60 Pounds', '2025-05-06', 47),
(98, 'Completed 10 Personal Training Sessions', '2025-05-11', 48),
(99, 'Participated in a Fitness Conference', '2025-05-16', 49),
(100, 'Achieved 1600 Workout Hours', '2025-05-21', 50);




INSERT INTO checkin_history (checkin_id, checkin_time, checkin_date, gym_id)
VALUES
(1, '09:00:00', '2024-01-01', 1),
(2, '09:15:00', '2024-01-01', 1),
(3, '09:30:00', '2024-01-01', 1),
(4, '09:45:00', '2024-01-01', 1),
(5, '10:00:00', '2024-01-01', 2),
(6, '10:15:00', '2024-01-01', 2),
(7, '10:30:00', '2024-01-01', 2),
(8, '10:45:00', '2024-01-01', 2),
(9, '11:00:00', '2024-01-01', 3),
(10, '11:15:00', '2024-01-01', 3),
(11, '11:30:00', '2024-01-01', 3),
(12, '11:45:00', '2024-01-01', 3),
(13, '12:00:00', '2024-01-01', 4),
(14, '12:15:00', '2024-01-01', 4),
(15, '12:30:00', '2024-01-01', 4),
(16, '12:45:00', '2024-01-01', 4),
(17, '13:00:00', '2024-01-01', 5),
(18, '13:15:00', '2024-01-01', 5),
(19, '13:30:00', '2024-01-01', 5),
(20, '13:45:00', '2024-01-01', 5),
(21, '14:00:00', '2024-01-01', 6),
(22, '14:15:00', '2024-01-01', 6),
(23, '14:30:00', '2024-01-01', 6),
(24, '14:45:00', '2024-01-01', 6),
(25, '15:00:00', '2024-01-01', 7),
(26, '15:15:00', '2024-01-01', 7),
(27, '15:30:00', '2024-01-01', 7),
(28, '15:45:00', '2024-01-01', 7),
(29, '16:00:00', '2024-01-01', 8),
(30, '16:15:00', '2024-01-01', 8),
(31, '16:30:00', '2024-01-01', 8),
(32, '16:45:00', '2024-01-01', 8),
(33, '17:00:00', '2024-01-01', 9),
(34, '17:15:00', '2024-01-01', 9),
(35, '17:30:00', '2024-01-01', 9),
(36, '17:45:00', '2024-01-01', 9),
(37, '18:00:00', '2024-01-01', 10),
(38, '18:15:00', '2024-01-01', 10),
(39, '18:30:00', '2024-01-01', 10),
(40, '18:45:00', '2024-01-01', 10),
(41, '09:00:00', '2024-01-02', 1),
(42, '09:15:00', '2024-01-02', 1),
(43, '09:30:00', '2024-01-02', 1),
(44, '09:45:00', '2024-01-02', 1),
(45, '10:00:00', '2024-01-02', 2),
(46, '10:15:00', '2024-01-02', 2),
(47, '10:30:00', '2024-01-02', 2),
(48, '10:45:00', '2024-01-02', 2),
(49, '11:00:00', '2024-01-02', 3),
(50, '11:15:00', '2024-01-02', 3),
(51, '11:30:00', '2024-01-02', 3),
(52, '11:45:00', '2024-01-02', 3),
(53, '12:00:00', '2024-01-02', 4),
(54, '12:15:00', '2024-01-02', 4),
(55, '12:30:00', '2024-01-02', 4),
(56, '12:45:00', '2024-01-02', 4),
(57, '13:00:00', '2024-01-02', 5),
(58, '13:15:00', '2024-01-02', 5),
(59, '13:30:00', '2024-01-02', 5),
(60, '13:45:00', '2024-01-02', 5),
(61, '14:00:00', '2024-01-02', 6),
(62, '14:15:00', '2024-01-02', 6),
(63, '14:30:00', '2024-01-02', 6),
(64, '14:45:00', '2024-01-02', 6),
(65, '15:00:00', '2024-01-02', 7),
(66, '15:15:00', '2024-01-02', 7),
(67, '15:30:00', '2024-01-02', 7),
(68, '15:45:00', '2024-01-02', 7),
(69, '16:00:00', '2024-01-02', 8),
(70, '16:15:00', '2024-01-02', 8),
(71, '16:30:00', '2024-01-02', 8),
(72, '16:45:00', '2024-01-02', 8),
(73, '17:00:00', '2024-01-02', 9),
(74, '17:15:00', '2024-01-02', 9),
(75, '17:30:00', '2024-01-02', 9),
(76, '17:45:00', '2024-01-02', 9),
(77, '18:00:00', '2024-01-02', 10),
(78, '18:15:00', '2024-01-02', 10),
(79, '18:30:00', '2024-01-02', 10),
(80, '18:45:00', '2024-01-02', 10),
(81, '09:00:00', '2024-01-03', 1),
(82, '09:15:00', '2024-01-03', 1),
(83, '09:30:00', '2024-01-03', 1),
(84, '09:45:00', '2024-01-03', 1),
(85, '10:00:00', '2024-01-03', 2),
(86, '10:15:00', '2024-01-03', 2),
(87, '10:30:00', '2024-01-03', 2),
(88, '10:45:00', '2024-01-03', 2),
(89, '11:00:00', '2024-01-03', 3),
(90, '11:15:00', '2024-01-03', 3),
(91, '11:30:00', '2024-01-03', 3),
(92, '11:45:00', '2024-01-03', 3),
(93, '12:00:00', '2024-01-03', 4),
(94, '12:15:00', '2024-01-03', 4),
(95, '12:30:00', '2024-01-03', 4),
(96, '12:45:00', '2024-01-03', 4),
(97, '13:00:00', '2024-01-03', 5),
(98, '13:15:00', '2024-01-03', 5),
(99, '13:30:00', '2024-01-03', 5),
(100, '13:45:00', '2024-01-03', 5);




INSERT INTO employee (employee_id, employee_name)
VALUES
(1, 'John Smith'),
(2, 'Jane Doe'),
(3, 'Alice Johnson'),
(4, 'Michael Brown'),
(5, 'Emily Davis'),
(6, 'David Wilson'),
(7, 'Sarah Miller'),
(8, 'James Taylor'),
(9, 'Laura Anderson'),
(10, 'Robert Martinez'),
(11, 'Jessica Thomas'),
(12, 'Daniel Jackson'),
(13, 'Laura White'),
(14, 'Charles Harris'),
(15, 'Barbara Clark'),
(16, 'Daniel Lewis'),
(17, 'Nancy Hall'),
(18, 'Gary Allen'),
(19, 'Linda Young'),
(20, 'Michael King'),
(21, 'Patricia Wright'),
(22, 'Steven Scott'),
(23, 'Deborah Green'),
(24, 'Joseph Adams'),
(25, 'Linda Nelson'),
(26, 'Charles Baker'),
(27, 'Megan Gonzalez'),
(28, 'Brian Perez'),
(29, 'Samantha Roberts'),
(30, 'Richard Turner');




INSERT INTO class (class_id, class_name, class_date, class_time, class_room_number, gym_id, instructor_id)
VALUES
(1, 'Yoga Basics', '2024-01-01', '08:00:00', 101, 1, 1),
(2, 'High-Intensity Interval Training', '2024-01-01', '09:00:00', 102, 1, 2),
(3, 'Pilates', '2024-01-01', '10:00:00', 103, 2, 3),
(4, 'Zumba', '2024-01-01', '11:00:00', 104, 2, 4),
(5, 'Spin Class', '2024-01-01', '12:00:00', 105, 3, 5),
(6, 'Kickboxing', '2024-01-01', '13:00:00', 106, 3, 6),
(7, 'Body Pump', '2024-01-01', '14:00:00', 107, 4, 7),
(8, 'Circuit Training', '2024-01-01', '15:00:00', 108, 4, 8),
(9, 'Meditation', '2024-01-01', '16:00:00', 109, 5, 9),
(10, 'Strength Training', '2024-01-01', '17:00:00', 110, 5, 10),
(11, 'Dance Cardio', '2024-01-02', '08:00:00', 101, 6, 11),
(12, 'Aqua Aerobics', '2024-01-02', '09:00:00', 102, 6, 12),
(13, 'Boot Camp', '2024-01-02', '10:00:00', 103, 7, 13),
(14, 'Barre Class', '2024-01-02', '11:00:00', 104, 7, 14),
(15, 'CrossFit', '2024-01-02', '12:00:00', 105, 8, 15),
(16, 'Core Conditioning', '2024-01-02', '13:00:00', 106, 8, 16),
(17, 'Senior Fitness', '2024-01-02', '14:00:00', 107, 9, 17),
(18, 'Family Yoga', '2024-01-02', '15:00:00', 108, 9, 18),
(19, 'Powerlifting', '2024-01-02', '16:00:00', 109, 10, 19),
(20, 'Cardio Dance', '2024-01-02', '17:00:00', 110, 10, 20),
(21, 'Tai Chi', '2024-01-03', '08:00:00', 101, 1, 21),
(22, 'Fitness Bootcamp', '2024-01-03', '09:00:00', 102, 1, 22),
(23, 'Kettlebell Training', '2024-01-03', '10:00:00', 103, 2, 23),
(24, 'Yoga for Beginners', '2024-01-03', '11:00:00', 104, 2, 24),
(25, 'Advanced Pilates', '2024-01-03', '12:00:00', 105, 3, 25),
(26, 'Boxing Fitness', '2024-01-03', '13:00:00', 106, 3, 26),
(27, 'Booty Camp', '2024-01-03', '14:00:00', 107, 4, 27),
(28, 'Flexibility Training', '2024-01-03', '15:00:00', 108, 4, 28),
(29, 'Fundamentals of Strength', '2024-01-03', '16:00:00', 109, 5, 29),
(30, 'Outdoor Circuit', '2024-01-03', '17:00:00', 110, 5, 30);




INSERT INTO my_appointment (appointment_id, appointment_date, appointment_time, activity_name, member_id, employee_id)
VALUES
(1, '2024-01-10', '10:00:00', 'Personal Training', 1, 1),
(2, '2024-01-11', '11:00:00', 'Nutrition Consultation', 2, 2),
(3, '2024-01-12', '12:00:00', 'Yoga Session', 3, 3),
(4, '2024-01-13', '13:00:00', 'Strength Training', 4, 4),
(5, '2024-01-14', '14:00:00', 'Fitness Assessment', 5, 5),
(6, '2024-01-15', '15:00:00', 'Cardio Coaching', 6, 6),
(7, '2024-01-16', '10:00:00', 'Posture Analysis', 7, 7),
(8, '2024-01-17', '11:00:00', 'Endurance Training', 8, 8),
(9, '2024-01-18', '12:00:00', 'Stretching Routine', 9, 9),
(10, '2024-01-19', '13:00:00', 'Body Fat Analysis', 10, 10),
(11, '2024-01-20', '14:00:00', 'Muscle Toning', 11, 11),
(12, '2024-01-21', '15:00:00', 'Flexibility Training', 12, 12),
(13, '2024-01-22', '10:00:00', 'Core Strengthening', 13, 13),
(14, '2024-01-23', '11:00:00', 'Weight Loss Program', 14, 14),
(15, '2024-01-24', '12:00:00', 'Balance Training', 15, 15),
(16, '2024-01-25', '13:00:00', 'HIIT Session', 16, 16),
(17, '2024-01-26', '14:00:00', 'Sports Conditioning', 17, 17),
(18, '2024-01-27', '15:00:00', 'Meditation Coaching', 18, 18),
(19, '2024-01-28', '10:00:00', 'Strength Evaluation', 19, 19),
(20, '2024-01-29', '11:00:00', 'Kettlebell Training', 20, 20),
(21, '2024-01-30', '12:00:00', 'Mobility Training', 21, 21),
(22, '2024-01-31', '13:00:00', 'Functional Fitness', 22, 22),
(23, '2024-02-01', '14:00:00', 'Agility Training', 23, 23),
(24, '2024-02-02', '15:00:00', 'Fitness Programming', 24, 24),
(25, '2024-02-03', '10:00:00', 'Diet Consultation', 25, 25),
(26, '2024-02-04', '11:00:00', 'Full-Body Workout', 26, 26),
(27, '2024-02-05', '12:00:00', 'Bootcamp Training', 27, 27),
(28, '2024-02-06', '13:00:00', 'Post-Workout Recovery', 28, 28),
(29, '2024-02-07', '14:00:00', 'Sports Massage', 29, 29),
(30, '2024-02-08', '15:00:00', 'Circuit Training', 30, 30);




INSERT INTO amenity (amenity_id, amenity_name, amenity_availability, gym_id)
VALUES
(1, 'Strength Training Area', true, 1),
(2, 'Cardio Machines', true, 1),
(3, 'Free Weights Area', true, 1),
(4, 'Functional Training Area', true, 2),
(5, 'Group Fitness Studio', true, 2),
(6, 'HIIT Zone', true, 2),
(7, 'Cycling Studio', true, 3),
(8, 'Yoga Studio', true, 3),
(9, 'Pilates Studio', true, 3),
(10, 'Personal Training Room', true, 4),
(11, 'HydroMassage Chairs', true, 4),
(12, 'Recovery Zone', true, 4),
(13, 'Strength Training Area', true, 5),
(14, 'Cardio Machines', true, 5),
(15, 'Free Weights Area', true, 5),
(16, 'Functional Training Area', true, 6),
(17, 'Group Fitness Studio', true, 6),
(18, 'HIIT Zone', true, 6),
(19, 'Cycling Studio', true, 7),
(20, 'Yoga Studio', true, 7),
(21, 'Pilates Studio', true, 7),
(22, 'Personal Training Room', true, 8),
(23, 'HydroMassage Chairs', true, 8),
(24, 'Recovery Zone', true, 8),
(25, 'Strength Training Area', true, 9),
(26, 'Cardio Machines', true, 9),
(27, 'Free Weights Area', true, 9),
(28, 'Functional Training Area', true, 10),
(29, 'Group Fitness Studio', true, 10),
(30, 'HIIT Zone', true, 10),
(31, 'Cycling Studio', true, 1),
(32, 'Yoga Studio', true, 2),
(33, 'Pilates Studio', true, 3),
(34, 'Personal Training Room', true, 4),
(35, 'HydroMassage Chairs', true, 5),
(36, 'Recovery Zone', true, 6),
(37, 'Strength Training Area', true, 7),
(38, 'Cardio Machines', true, 8),
(39, 'Free Weights Area', true, 9),
(40, 'Functional Training Area', true, 10),
(41, 'Group Fitness Studio', true, 1),
(42, 'HIIT Zone', true, 2),
(43, 'Cycling Studio', true, 3),
(44, 'Yoga Studio', true, 4),
(45, 'Pilates Studio', true, 5),
(46, 'Personal Training Room', true, 6),
(47, 'HydroMassage Chairs', true, 7),
(48, 'Recovery Zone', true, 8),
(49, 'Strength Training Area', true, 9),
(50, 'Cardio Machines', true, 10);





INSERT INTO equipment (equipment_id, equipment_name, location, condition, description, gym_id)
VALUES
(1, 'Treadmill', 'Cardio Room', 'Good', 'High-end cardio machine', 1),
(2, 'Elliptical', 'Cardio Room', 'Good', 'Low-impact cardio machine', 1),
(3, 'Rowing Machine', 'Cardio Room', 'Good', 'Full-body cardio workout', 1),
(4, 'Leg Press', 'Weight Room', 'Excellent', 'Lower body strength', 2),
(5, 'Bench Press', 'Weight Room', 'Excellent', 'Upper body strength', 2),
(6, 'Squat Rack', 'Weight Room', 'Good', 'Lower body strength', 2),
(7, 'Dumbbells', 'Free Weights Area', 'Excellent', 'Variety of weight options', 3),
(8, 'Kettlebells', 'Free Weights Area', 'Good', 'Functional training weights', 3),
(9, 'Pull-Up Bar', 'Functional Training Area', 'Good', 'Upper body strength', 3),
(10, 'Smith Machine', 'Weight Room', 'Good', 'Assisted weight lifting', 4),
(11, 'Cable Machine', 'Functional Training Area', 'Excellent', 'Multi-use machine', 4),
(12, 'Lat Pulldown', 'Weight Room', 'Good', 'Back and shoulder workout', 4),
(13, 'Spin Bike', 'Cycling Studio', 'Excellent', 'High-intensity cardio', 5),
(14, 'Resistance Bands', 'Functional Training Area', 'Good', 'Strength and mobility training', 5),
(15, 'Barbells', 'Free Weights Area', 'Excellent', 'Full-body strength', 5),
(16, 'Battle Ropes', 'Functional Training Area', 'Good', 'High-intensity conditioning', 6),
(17, 'Rowing Machine', 'Cardio Room', 'Good', 'Full-body cardio', 6),
(18, 'TRX Suspension Trainer', 'Functional Training Area', 'Excellent', 'Bodyweight exercise system', 6),
(19, 'Leg Curl Machine', 'Weight Room', 'Good', 'Lower body isolation', 7),
(20, 'Incline Bench Press', 'Weight Room', 'Good', 'Chest strength', 7),
(21, 'Preacher Curl Machine', 'Weight Room', 'Excellent', 'Arm strength', 7),
(22, 'Yoga Mats', 'Yoga Studio', 'Good', 'Flexibility and balance', 8),
(23, 'Medicine Balls', 'Functional Training Area', 'Good', 'Functional training', 8),
(24, 'Foam Rollers', 'Recovery Zone', 'Good', 'Post-workout recovery', 8),
(25, 'Rowing Machine', 'Cardio Room', 'Good', 'Full-body cardio', 9),
(26, 'Treadmill', 'Cardio Room', 'Good', 'High-end cardio machine', 9),
(27, 'Pull-Up Bar', 'Functional Training Area', 'Good', 'Upper body strength', 9),
(28, 'Kettlebells', 'Free Weights Area', 'Excellent', 'Functional training', 10),
(29, 'Squat Rack', 'Weight Room', 'Good', 'Lower body strength', 10),
(30, 'Spin Bike', 'Cycling Studio', 'Good', 'Cardio training', 10),
(31, 'Leg Press', 'Weight Room', 'Good', 'Lower body strength', 1),
(32, 'Elliptical', 'Cardio Room', 'Good', 'Low-impact cardio machine', 1),
(33, 'Dumbbells', 'Free Weights Area', 'Good', 'Upper body strength', 2),
(34, 'Preacher Curl Machine', 'Weight Room', 'Good', 'Arm strength', 2),
(35, 'TRX Suspension Trainer', 'Functional Training Area', 'Excellent', 'Bodyweight training', 3),
(36, 'Smith Machine', 'Weight Room', 'Good', 'Assisted weight lifting', 3),
(37, 'Cable Machine', 'Functional Training Area', 'Excellent', 'Strength training', 4),
(38, 'Yoga Mats', 'Yoga Studio', 'Good', 'Flexibility training', 4),
(39, 'Resistance Bands', 'Functional Training Area', 'Good', 'Strength and mobility', 5),
(40, 'Spin Bike', 'Cycling Studio', 'Excellent', 'Cardio training', 6),
(41, 'Battle Ropes', 'Functional Training Area', 'Good', 'High-intensity workout', 7),
(42, 'Foam Rollers', 'Recovery Zone', 'Good', 'Post-workout recovery', 8),
(43, 'Kettlebells', 'Free Weights Area', 'Good', 'Functional training', 9),
(44, 'Leg Curl Machine', 'Weight Room', 'Good', 'Lower body isolation', 10),
(45, 'Rowing Machine', 'Cardio Room', 'Good', 'Cardio training', 10),
(46, 'Medicine Balls', 'Functional Training Area', 'Good', 'Core strength', 1),
(47, 'Treadmill', 'Cardio Room', 'Excellent', 'Cardio training', 2),
(48, 'Lat Pulldown', 'Weight Room', 'Good', 'Back strength', 3),
(49, 'Yoga Mats', 'Yoga Studio', 'Good', 'Balance and flexibility', 4),
(50, 'Barbells', 'Free Weights Area', 'Excellent', 'Strength training', 5);




INSERT INTO exercise (exercise_id, focus_areas, exercise_level, equipment_id)
VALUES
(1, 'Cardio', 'Beginner', 1),
(2, 'Cardio', 'Intermediate', 2),
(3, 'Full-body', 'Intermediate', 3),
(4, 'Legs', 'Advanced', 4),
(5, 'Chest', 'Advanced', 5),
(6, 'Legs', 'Advanced', 6),
(7, 'Full-body', 'Intermediate', 7),
(8, 'Strength', 'Beginner', 8),
(9, 'Upper body', 'Intermediate', 9),
(10, 'Chest', 'Advanced', 10),
(11, 'Strength', 'Intermediate', 11),
(12, 'Back', 'Intermediate', 12),
(13, 'Cardio', 'Beginner', 13),
(14, 'Strength', 'Intermediate', 14),
(15, 'Strength', 'Advanced', 15),
(16, 'Conditioning', 'Intermediate', 16),
(17, 'Full-body', 'Beginner', 17),
(18, 'Strength', 'Advanced', 18),
(19, 'Legs', 'Advanced', 19),
(20, 'Chest', 'Intermediate', 20),
(21, 'Arms', 'Advanced', 21),
(22, 'Flexibility', 'Beginner', 22),
(23, 'Core', 'Intermediate', 23),
(24, 'Recovery', 'Beginner', 24),
(25, 'Cardio', 'Beginner', 25),
(26, 'Cardio', 'Intermediate', 26),
(27, 'Upper body', 'Intermediate', 27),
(28, 'Strength', 'Beginner', 28),
(29, 'Legs', 'Advanced', 29),
(30, 'Cardio', 'Beginner', 30),
(31, 'Legs', 'Advanced', 31),
(32, 'Cardio', 'Beginner', 32),
(33, 'Strength', 'Intermediate', 33),
(34, 'Arms', 'Advanced', 34),
(35, 'Strength', 'Intermediate', 35),
(36, 'Chest', 'Advanced', 36),
(37, 'Strength', 'Intermediate', 37),
(38, 'Flexibility', 'Beginner', 38),
(39, 'Strength', 'Beginner', 39),
(40, 'Cardio', 'Intermediate', 40),
(41, 'Conditioning', 'Intermediate', 41),
(42, 'Recovery', 'Beginner', 42),
(43, 'Strength', 'Intermediate', 43),
(44, 'Legs', 'Intermediate', 44),
(45, 'Cardio', 'Beginner', 45),
(46, 'Core', 'Beginner', 46),
(47, 'Cardio', 'Intermediate', 47),
(48, 'Back', 'Intermediate', 48),
(49, 'Balance', 'Beginner', 49),
(50, 'Strength', 'Advanced', 50);





INSERT INTO media (media_id, exercise_id, format, source)
VALUES 
(1, 1, 'Video', 'YouTube'),
(2, 2, 'Image', 'Vimeo'),
(3, 3, 'Video', 'YouTube'),
(4, 4, 'PDF', 'Google Drive'),
(5, 5, 'Video', 'Vimeo'),
(6, 6, 'Image', 'Google Drive'),
(7, 7, 'Video', 'YouTube'),
(8, 8, 'Video', 'Vimeo'),
(9, 9, 'Image', 'Google Drive'),
(10, 10, 'Video', 'YouTube'),
(11, 11, 'Video', 'YouTube'),
(12, 12, 'PDF', 'Google Drive'),
(13, 13, 'Image', 'Vimeo'),
(14, 14, 'Video', 'YouTube'),
(15, 15, 'Video', 'Vimeo'),
(16, 16, 'Video', 'YouTube'),
(17, 17, 'Image', 'Google Drive'),
(18, 18, 'Video', 'Vimeo'),
(19, 19, 'Video', 'YouTube'),
(20, 20, 'Video', 'YouTube'),
(21, 21, 'Image', 'Google Drive'),
(22, 22, 'PDF', 'Google Drive'),
(23, 23, 'Video', 'YouTube'),
(24, 24, 'Video', 'Vimeo'),
(25, 25, 'Image', 'Google Drive'),
(26, 26, 'Video', 'YouTube'),
(27, 27, 'Video', 'YouTube'),
(28, 28, 'Image', 'Google Drive'),
(29, 29, 'Video', 'Vimeo'),
(30, 30, 'Image', 'Google Drive'),
(31, 31, 'Video', 'YouTube'),
(32, 32, 'Video', 'Vimeo'),
(33, 33, 'PDF', 'Google Drive'),
(34, 34, 'Image', 'YouTube'),
(35, 35, 'Video', 'YouTube'),
(36, 36, 'Video', 'Vimeo'),
(37, 37, 'Image', 'Google Drive'),
(38, 38, 'Video', 'YouTube'),
(39, 39, 'Video', 'YouTube'),
(40, 40, 'Image', 'Google Drive'),
(41, 41, 'PDF', 'Google Drive'),
(42, 42, 'Video', 'YouTube'),
(43, 43, 'Video', 'Vimeo'),
(44, 44, 'Image', 'Google Drive'),
(45, 45, 'Video', 'YouTube'),
(46, 46, 'Video', 'Vimeo'),
(47, 47, 'Video', 'YouTube'),
(48, 48, 'PDF', 'Google Drive'),
(49, 49, 'Video', 'Vimeo'),
(50, 50, 'Image', 'Google Drive');

