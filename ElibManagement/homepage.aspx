<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="ElibManagement.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
    <div style="position: relative; width: 100%; height: 30vh;">
    <img src="imgs/bg.jpg" style="width:100%; height:100%; object-fit:cover" class="img-fluid">
    
    <h2 style="
        position: absolute; 
        top: 50%; 
        left: 50%; 
        transform: translate(-50%, -50%);
        color: whitesmoke;
        font-size: 2rem;
        font-weight: bold;
        margin: 0;
    ">
        Online Library Management
    </h2>
</div>
</section>

<section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <center>
                <h2>
                    Our Features
                </h2>
                <p><b>Our 3 Primary Features</b></p>
                </center>
            </div>
        </div>
         
            <div class="row">

   <div class="col-md-4 text-center">
        <img width="150px"src="imgs/bookinv.jpg" />
       <h4>Digital Inventory</h4>
        <p class="text-justify">
         Access a vast collection of e-books and audiobooks from various genres 
         and authors, all available at your fingertips.
         </p>
 </div>

  <div class="col-md-4 text-center">
      <img width="150px"src="imgs/booksearch.jpg" />
    <h4>Search Books</h4>
    <p class="text-justify">
      Quickly find any book by title, author, or keywords using our easy and fast search tool.
    </p>
  </div>

  <div class="col-md-4 text-center">
   <img width="150px" src="imgs/defaulter.jpg" />
    <h4>Defaulter List</h4>
    <p class="text-justify">
      View students who have overdue books and manage pending returns with ease.
    </p>
  </div>
</div>
    </div>
</section>

<section>
    <div style="position: relative; width: 100%; height: 30vh;">
    <img src="imgs/bg3.jpg" style="width:100%; height:100%; object-fit:cover" class="img-fluid">
    
    <h2 style="
        position: absolute; 
        top: 50%; 
        left: 50%; 
        transform: translate(-50%, -50%);
        color: whitesmoke;
        font-size: 2rem;
        font-weight: bold;
        margin: 0;
    ">
        Here to Serve You Better!
    </h2>
</div>
</section>

<section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <center>
                <h2>
                    Our Process
                </h2>
                <p><b>We have a simple 3 step process</b></p>
                </center>
            </div>
        </div>
         
            <div class="row">

    <div class="col-md-4 text-center">
     <img width="150px"src="imgs/sign.jpg" />
   <h4>Sign up</h4>
   <p class="text-justify">
      Create your account to access the library system and manage your books easily.
   </p>
 </div>

  <div class="col-md-4 text-center">
      <img width="150px"src="imgs/booksearch.jpg" />
    <h4>Search Books</h4>
    <p class="text-justify">
      Quickly find any book by title, author, or keywords using our easy and fast search tool.
    </p>
  </div>

  <div class="col-md-4 text-center">
   <img width="150px" src="imgs/visit.jpg" />
    <h4>Visit us</h4>
    <p class="text-justify">
        Drop by our library to explore resources, get assistance, and enjoy a quiet study space.

    </p>
  </div>
</div>
    </div>
</section>
</asp:Content>
