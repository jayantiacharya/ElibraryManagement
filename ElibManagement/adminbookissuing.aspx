<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="ElibManagement.adminbookissuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <div class="row">

        <!-- LEFT SIDE (Book Issuing Form) -->
        <div class="col-md-5">

            <div class="card">
                <div class="card-body">

                    <div class="row">
                        <div class="col text-center">
                            <h4>Book Issuing</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col text-center">
                            <img width="200px" src="imgs/bookissue.jpg" />
                        </div>
                    </div>

                    <hr />

                    <!-- Member ID + Book ID -->
                    <div class="row">
                        <div class="col-md-6">
                            <label>Member ID</label>
                            <asp:TextBox CssClass="form-control" runat="server" placeholder="Member ID" TextMode="Number"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label>Book ID</label>
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" runat="server" placeholder="Book ID"></asp:TextBox>
                                <asp:Button ID="Button5" class="btn btn-primary" runat="server" Text="Go" />
                            </div>
                        </div>
                    </div>

                    <!-- Member Name + Book Name -->
                    <div class="row md-2">
                        <div class="col-md-6">
                            <label>Member Name</label>
                            <asp:TextBox CssClass="form-control" runat="server" placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label>Book Name</label>
                            <asp:TextBox CssClass="form-control" runat="server" placeholder="Book Name" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Dates -->
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label>Start Date</label>
                            <asp:TextBox CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label>End Date</label>
                            <asp:TextBox CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="row mt-3">
                        <div class="col-6">
                            <asp:Button ID="Button1" CssClass="btn btn-info btn-block btn-lg" runat="server" Text="Issue" />
                        </div>
                        <div class="col-6">
                            <asp:Button ID="Button4" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="Return" />
                        </div>
                    </div>

                </div>
            </div>

            <a href="Home.aspx"> >> Back to Home</a>
            <br /><br />

        </div> <!-- END OF LEFT COLUMN -->


        <!-- RIGHT SIDE (Publisher List) -->
        <div class="col-md-7">
            <div class="card">
                <div class="card-body">

                    <h4 class="text-center">Publisher List</h4>
                    <hr />

                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered"></asp:GridView>

                </div>
            </div>
        </div>

    </div>
</div>
</asp:Content>
