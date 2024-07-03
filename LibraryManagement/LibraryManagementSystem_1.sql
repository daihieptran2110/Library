-- Create logins for Admin, Staff, and Members if they do not already exist
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'AdminLogin')
    CREATE LOGIN AdminLogin WITH PASSWORD = 'admin_password';
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'StaffLogin')
    CREATE LOGIN StaffLogin WITH PASSWORD = 'staff_password';
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'MemberLogin')
    CREATE LOGIN MemberLogin WITH PASSWORD = 'members_password';

-- Create database
CREATE DATABASE LibraryManagement;
GO

USE LibraryManagement;
GO

-- Create users for Admin, Staff, and Members if they do not already exist
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AdminUser')
    CREATE USER AdminUser FOR LOGIN AdminLogin;
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'StaffUser')
    CREATE USER StaffUser FOR LOGIN StaffLogin;
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'MemberUser')
    CREATE USER MemberUser FOR LOGIN MemberLogin;

-- Create tables
CREATE TABLE Publishers (
    publisher_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    address NVARCHAR(255),
    contact NVARCHAR(50)
);

CREATE TABLE Categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    description NVARCHAR(MAX)
);

CREATE TABLE Books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    isbn NVARCHAR(13) NOT NULL UNIQUE,
    publisher_id INT,
    publication_year INT,
    category_id INT,
    total_copies INT NOT NULL,
    available_copies INT NOT NULL,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Authors (
    author_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    birthdate DATE,
    nationality NVARCHAR(50)
);

CREATE TABLE Book_Authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Account (
    account_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(100) UNIQUE NOT NULL,
    password NVARCHAR(100) NOT NULL,
    role NVARCHAR(50) NOT NULL,
    information_status NVARCHAR(20) DEFAULT 'not yet updated'
);

CREATE TABLE Admin (
    admin_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(100) UNIQUE NOT NULL,
    password NVARCHAR(100) NOT NULL,
    FOREIGN KEY (username) REFERENCES Account(username)
);

CREATE TABLE Members (
    member_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(100) NOT NULL,
    password NVARCHAR(100) NOT NULL,
    first_name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    phone NVARCHAR(20),
    address NVARCHAR(255),
    membership_date DATE NOT NULL,
    FOREIGN KEY (username) REFERENCES Account(username)
);

CREATE TABLE Staff (
    staff_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(100) NOT NULL,
    password NVARCHAR(100) NOT NULL,
    first_name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    phone NVARCHAR(20),
    position NVARCHAR(100),
    hire_date DATE Not NULL,
    FOREIGN KEY (username) REFERENCES Account(username)
);

CREATE TABLE Loans (
    loan_id INT IDENTITY(1,1) PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    staff_id INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

CREATE TABLE Reservations (
    reservation_id INT IDENTITY(1,1) PRIMARY KEY,
    book_id INT,
    member_id INT,
    reservation_date DATE NOT NULL,
    status NVARCHAR(20) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

CREATE TABLE EmailNotifications (
    notification_id INT IDENTITY(1,1) PRIMARY KEY,
    member_id INT,
    email NVARCHAR(100) NOT NULL,
    subject NVARCHAR(255) NOT NULL,
    body NVARCHAR(MAX) NOT NULL,
    sent_date DATETIME,
    status NVARCHAR(20) NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Grant permissions to AdminUser
GRANT SELECT, INSERT, UPDATE, DELETE ON Publishers TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Categories TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Books TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Authors TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Book_Authors TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Members TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Staff TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Loans TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Reservations TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON EmailNotifications TO AdminUser;

-- Grant permissions to StaffUser
GRANT SELECT, INSERT, UPDATE, DELETE ON Books TO StaffUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Loans TO StaffUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Reservations TO StaffUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON EmailNotifications TO StaffUser;

-- Grant permissions to MemberUser
GRANT SELECT ON Books TO MemberUser;
GRANT SELECT ON Loans TO MemberUser;
GRANT SELECT ON Reservations TO MemberUser;
GRANT SELECT ON EmailNotifications TO MemberUser;
