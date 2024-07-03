INSERT INTO dbo.Account(username, password, role) 
VALUES ('admin', 'Phuongmeomun1274@', 'Admin');
INSERT INTO dbo.Admin(username, password) VALUES ('admin', 'Phuongmeomun1274@');
INSERT INTO dbo.Account(username, password, role) 
VALUES ('DucNH', '12345678', 'Staff');
INSERT INTO dbo.Account(username, password, role) 
VALUES ('HiepTD', '123456789', 'Members');
INSERT INTO Staff ( username, password, first_name, last_name, email, phone, position, hire_date) 
VALUES ( 'DucNH', '12345678', 'Duc', 'Nguyen', 'ducnh@example.com', '1234567890', 'Librarian', GETDATE());
-- Insert into Members table
INSERT INTO Members (username, password, first_name, last_name, email, phone, address, membership_date) 
VALUES 
('HiepTD', '123456789', 'Hiep', 'Tran', 'hieptd@example.com', '0987654321', '123 Example St', GETDATE());