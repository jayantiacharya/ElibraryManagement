<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="ElibManagement.adminbookinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
        <div class="row">

            <!-- LEFT SIDE -->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col text-center">
                                <h4>Book Details</h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <img width="200px" src="imgs/booksearch.jpg" />
                            </div>
                        </div>

                        <hr />

                        <!-- File Upload -->
                        <div class="row">
                            <div class="col">
                                <asp:FileUpload class="form-control" ID="fileupload1" runat="server" />
                            </div>
                        </div>

                        <!-- Book ID + Book Name-->
                        <div class="row">

                            <div class="col-md-3">
                                <label>Book ID</label>
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" runat="server" placeholder="Book ID"></asp:TextBox>
                                    <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server">
                                    <i class="fas fa-check-circle"></i>
                                    </asp:LinkButton>
                                </div>
                            </div>

                            <div class="col-md-9">
                                <label>Book Name</label>
                                <asp:TextBox CssClass="form-control" ID="textbox2" runat="server" placeholder="Book Name"></asp:TextBox>
                            </div>

                        </div>

                        <!-- Language + Author + Genre -->


                        <div class="row">

                            <!-- LANGUAGE COLUMN -->
                            <div class="col-md-4">
                                <label>Language</label>
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="English" Value="English" />
                                    <asp:ListItem Text="Nepali" Value="Nepali" />
                                    <asp:ListItem Text="Hindi" Value="Hindi" />
                                    <asp:ListItem Text="French" Value="French" />
                                    <asp:ListItem Text="German" Value="German" />
                                </asp:DropDownList>

                                <!-- Publisher Name -->
                                <label class="mt-2">Publisher Name</label>
                                <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="Publisher 1" Value="Publisher1" />
                                    <asp:ListItem Text="Publisher 2" Value="Publisher2" />
                                </asp:DropDownList>
                            </div>

                            <!-- AUTHOR COLUMN -->
                            <div class="col-md-4">
                                <label>Author</label>
                                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="A1" Value="A1" />
                                    <asp:ListItem Text="A2" Value="A2" />
                                </asp:DropDownList>

                                <!-- Publish Date -->
                                <label class="mt-2">Publish Date</label>
                                <asp:TextBox ID="txtPublishDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                            </div>

                            <!-- GENRE COLUMN -->
                            <div class="col-md-4">
                                <label>Genre</label>
                                <asp:ListBox ID="ListBox3" CssClass="form-control" SelectionMode="Multiple" Rows="4" runat="server">
                                    <asp:ListItem Text="Self Help" Value="Self Help" />
                                    <asp:ListItem Text="Motivation" Value="Motivation" />
                                    <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                    <asp:ListItem Text="Wellness" Value="Wellness" />
                                    <asp:ListItem Text="Drama" Value="Drama" />
                                    <asp:ListItem Text="Romance" Value="Romance" />
                                    <asp:ListItem Text="Horror" Value="Horror" />
                                    <asp:ListItem Text="Action" Value="Action" />


                                </asp:ListBox>
                            </div>

                        </div>

                        <!-- FIRST ROW -->
                        <div class="row mt-3">

                            <div class="col-md-4">
                                <label>Edition</label>
                                <asp:TextBox CssClass="form-control" runat="server" placeholder="1st"></asp:TextBox>
                            </div>

                            <div class="col-md-4">
                                <label>Book cost(per unit)</label>
                                <asp:TextBox CssClass="form-control" runat="server" placeholder="100"></asp:TextBox>
                            </div>

                            <div class="col-md-4">
                                <label>Pages</label>
                                <asp:TextBox CssClass="form-control" runat="server" placeholder="312"></asp:TextBox>
                            </div>

                        </div>


                        <!-- SECOND ROW -->
                        <div class="row mt-3">

                            <div class="col-md-4">
                                <label>Actual Stock</label>
                                <asp:TextBox CssClass="form-control" runat="server" placeholder="13"></asp:TextBox>
                            </div>

                            <div class="col-md-4">
                                <label>Current Stock</label>
                                <asp:TextBox CssClass="form-control" runat="server" ReadOnly="true" placeholder="12"></asp:TextBox>
                            </div>

                            <div class="col-md-4">
                                <label>Issued Books</label>
                                <asp:TextBox CssClass="form-control" runat="server" ReadOnly="true" placeholder="1"></asp:TextBox>
                            </div>

                        </div>

                        <!-- BOOK DESCRIPTION -->
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label>Book Description</label>
                                <asp:TextBox
                                    ID="txtBookDescription"
                                    runat="server"
                                    CssClass="form-control"
                                    TextMode="MultiLine"
                                    Rows="4"
                                    Placeholder="Enter a beautiful description here… 
Example:
A captivating story that blends adventure, emotion, and mystery, 
inviting readers into a world full of imagination and meaning.">
                                </asp:TextBox>
                            </div>
                        </div>




                        <!-- Delete Button -->
                        <!-- Action Buttons: Add - Update - Delete -->
                        <div class="row mt-3">

                            <!-- ADD -->
                            <div class="col-md-4">
                                <asp:Button ID="btnAdd"
                                    runat="server"
                                    CssClass="btn btn-success btn-block btn-lg"
                                    Text="Add" />
                            </div>

                            <!-- UPDATE -->
                            <div class="col-md-4">
                                <asp:Button ID="btnUpdate"
                                    runat="server"
                                    CssClass="btn btn-primary btn-block btn-lg"
                                    Text="Update" />
                            </div>

                            <!-- DELETE -->
                            <div class="col-md-4">
                                <asp:Button ID="btnDelete"
                                    runat="server"
                                    CssClass="btn btn-danger btn-block btn-lg"
                                    Text="Delete" />
                            </div>

                        </div>


                    </div>
                </div>

                <a href="Home.aspx">>> Back to Home</a>
                <br />
                <br />
            </div>

            <!-- RIGHT SIDE -->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Book Inventory List</h4>
                        <hr />
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered"></asp:GridView>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
