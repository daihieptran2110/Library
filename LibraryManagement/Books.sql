-- Inserting into Categories table without specifying category_id
INSERT INTO [LibraryManagement].[dbo].[Categories] ([name], [description])
VALUES 
    ('Fiction', 'Books that are not based on real events or people.'),
    ('Non-fiction', 'Books that are based on real events or people.'),
    ('Science Fiction', 'Books that speculate on scientific possibilities.'),
    ('Mystery', 'Books involving a crime or puzzle to be solved.'),
    ('Biography', 'Books that tell the story of a person''s life.');
-- Inserting into Publishers table without specifying publisher_id
INSERT INTO [LibraryManagement].[dbo].[Publishers] ([name], [address], [contact])
VALUES
    ('Penguin Random House', '123 Main St, New York, NY', 'contact@penguinrandomhouse.com'),
    ('HarperCollins Publishers', '456 Oak St, Chicago, IL', 'contact@harpercollins.com'),
    ('Simon & Schuster', '789 Elm St, San Francisco, CA', 'contact@simonandschuster.com'),
    ('Macmillan Publishers', '567 Maple Ave, Boston, MA', 'contact@macmillanpublishers.com'),
    ('Hachette Book Group', '890 Pine St, Los Angeles, CA', 'contact@hachettebookgroup.com');
-- Inserting into Books table with valid category_id and publisher_id references
INSERT INTO [LibraryManagement].[dbo].[Books] ([title], [isbn], [publisher_id], [publication_year], [category_id], [total_copies], [available_copies])
VALUES
    ('To Kill a Mockingbird', '9780061120084', 1, 1960, 1, 50, 50),
    ('1984', '9780451524935', 2, 1949, 1, 30, 30),
    ('Harry Potter and the Sorcerer''s Stone', '9780590353427', 3, 1997, 1, 40, 40),
    ('The Da Vinci Code', '9780307474278', 4, 2003, 2, 25, 25),
    ('A Brief History of Time', '9780553380163', 5, 1988, 2, 20, 20),
    ('The Girl with the Dragon Tattoo', '9780307269751', 1, 2005, 4, 35, 35),
    ('Steve Jobs', '9781451648539', 2, 2011, 5, 15, 15),
    ('The Hitchhiker''s Guide to the Galaxy', '9780345391803', 3, 1979, 3, 20, 20),
    ('Gone Girl', '9780307588364', 4, 2012, 4, 30, 30),
    ('Sapiens: A Brief History of Humankind', '9780062316097', 5, 2014, 2, 25, 25);
