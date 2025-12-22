<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="ElibManagement.adminpublishermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
     $(document).ready(function () {
         $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
     });
    
     </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                           

                        <!-- Title -->
                        <div class="row">
                            <div class="col text-center">
                                <h4>Publisher Details</h4>
                               
                            </div>
                        </div>



                        <!-- Logo -->
                     
                        <div class="row">
                <div class="col text-center">
                    <img width="100px" src="imgs/publisher.png" />
                </div>
                    </div>




                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <!-- Publisher ID and Name -->
                        <div class="row">
                            <div class="col-md-4">
                                <label>Publisher ID</label>
                                <div class="form-group">
                                    <div class="input-group">


         
                                    <asp:TextBox CssClass="form-control" runat="server" placeholder= "ID" ID="TextBox1"></asp:TextBox>
                                    <asp:Button class="btn btn-primary " ID="Button5" runat="server" Text="Go" OnClick="Button5_Click" />
                                      </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Publisher Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" runat="server" placeholder="Name" ID="TextBox2"></asp:TextBox>
                                </div>
                            </div>
                        </div>










                        <!-- Buttons -->
            
                        <div class="row">
                            <div class="col-4">
                            <asp:Button ID="Button2" CssClass="btn btn-lg btn-success btn-block " runat="server" Text="Add" OnClick="Button2_Click" />
                        </div>
                                <div class="col-4">
    <asp:Button ID="Button1" CssClass="btn btn-lg btn-warning btn-block " runat="server" Text="Update" OnClick="Button1_Click" />
</div>
                                <div class="col-4">
    <asp:Button ID="Button4" CssClass="btn btn-lg btn-danger btn-block " runat="server" Text="Delete" OnClick="Button4_Click" />
</div>
        

                </div>
                </div>
                </div>
                 



                <a href="Home.aspx"> >> Back to Home </a>
                <br /><br />

            </div>


            <div class="col-md-7">
                           

                <div class="card">
                    <div class="card-body">

           
                        <!-- Title -->
                        <div class="row">
                            <div class="col text-center">
                                <h4>Publisher list</h4>                      
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibrarydbConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                            <div class="col">

                                <asp:GridView class="table table-striped table-bordered"  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" ReadOnly="True" SortExpression="publisher_id" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                                    </Columns>
                                </asp:GridView>

                            </div>

                        </div>




             
                      
       
            </div>

            </div>
            </div>
            </div>


        </div>
</asp:Content>
