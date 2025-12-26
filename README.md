E-Library Management System

A web-based E-Library Management System built with ASP.NET Web Forms and C#. This system allows users to manage library accounts, issue and return books, and track due dates efficiently.

Features
User Features

User registration and login.

Profile management:

Update personal details (name, contact, email, address, etc.).

Change password.

View issued books with due dates.

Overdue books are highlighted automatically.

Admin Features (Optional if implemented)

Manage users and accounts.

Add, update, or remove books.

Monitor issued and returned books.

Technical Features

Backend: C#, ASP.NET Web Forms

Database: SQL Server

Frontend: Bootstrap 4 for responsive design

Data validation and session management

Dynamic GridView for book lists

Color-coded status badges for account and overdue books

Installation / Setup

Clone the repository

git clone https://github.com/yourusername/e-library-management.git


Open in Visual Studio

Open userprofile.aspx or the main project solution .sln.

Restore NuGet packages if prompted.

Set up the database

Create a SQL Server database named elibrarydb.

Run the provided SQL script (if included) to create tables:

member_master_tbl

book_issue_tbl

Update the connection string in Web.config:

<connectionStrings>
    <add name="con" connectionString="Data Source=YOUR_SERVER;Initial Catalog=elibrarydb;Integrated Security=True"/>
</connectionStrings>


Run the project

Press F5 in Visual Studio to run the project locally.

Login using a registered user account to see the profile and issued books.

Usage

Navigate to userlogin.aspx to login.

After login, access your profile to view and update personal information.

Check the issued books list; overdue books will be highlighted in red.

Update your password directly from your profile page.

Screenshots

<img width="1901" height="881" alt="image" src="https://github.com/user-attachments/assets/eb525b48-43df-426c-900b-1fead7cf3682" />



//More to be added!

Future Improvements

Implement Admin dashboard for book management.

Add email notifications for overdue books.

Integrate search and filter functionality for books.

Use Entity Framework for cleaner database handling.

License

This project is for educational purposes. Feel free to use and modify it.
