<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="ElibManagement.adminbookissuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });

     </script> 
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
                            <asp:TextBox CssClass="form-control" runat="server" placeholder="Member ID"   ID="textbox1"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label>Book ID</label>
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" runat="server" placeholder="Book ID" OnTextChanged="Unnamed1_TextChanged" ID="textbox2"></asp:TextBox>
                                <asp:Button ID="Button5" class="btn btn-dark" runat="server" Text="Go" OnClick="Button5_Click" />
                            </div>
                        </div>
                    </div>

                    <!-- Member Name + Book Name -->
                    <div class="row md-2">
                        <div class="col-md-6">
                            <label>Member Name</label>
                            <asp:TextBox CssClass="form-control" runat="server" placeholder="Member Name" ReadOnly="true" ID="textbox3"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label>Book Name</label>
                            <asp:TextBox CssClass="form-control" runat="server" placeholder="Book Name" ReadOnly="true" ID="textbox4"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Dates -->
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label>Start Date</label>
                            <asp:TextBox CssClass="form-control" runat="server" TextMode="Date" ID="TextBox5"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label>End Date</label>
                            <asp:TextBox CssClass="form-control" runat="server" TextMode="Date" ID="TextBox6"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="row mt-3">
                        <div class="col-6">
                            <asp:Button ID="Button1" CssClass="btn btn-info btn-block btn-lg" runat="server" Text="Issue" OnClick="Button1_Click" />
                        </div>
                        <div class="col-6">
                            <asp:Button ID="Button4" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="Return" OnClick="Button4_Click" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibrarydbConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                            <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                            <asp:BoundField DataField="book_id" HeaderText="Book ID" ReadOnly="True" SortExpression="book_id" />
                            <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                            <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                            <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                        </Columns>
                    </asp:GridView>

                </div>
            </div>
        </div>

    </div>
</div>
</asp:Content>
