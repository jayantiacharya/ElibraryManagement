<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="adminmembermanagement.aspx.cs"
    Inherits="ElibManagement.adminmembermanagement" %>

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

        <!-- LEFT SIDE -->
<div class="col-md-5">
    <div class="card">
        <div class="card-body">

            <h4 class="text-center">Member Details</h4>
            <div class="text-center mb-2">
                <img src="imgs/login.png" width="150" />
            </div>
            <hr />

            <!-- MEMBER ID + FULL NAME + ACCOUNT STATUS IN ONE ROW -->
            <div class="row">
                <!-- Member ID -->
                <div class="col-md-3">
                    <label>Member ID</label>
                    <div class="input-group">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
                        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-primary" OnClick="LinkButton4_Click">
                            <i class="fas fa-search"></i>
                        </asp:LinkButton>
                    </div>
                </div>

                <!-- Full Name -->
                <div class="col-md-4">
                    <label>Full Name</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>

                <!-- Account Status -->
                <div class="col-md-5">
                    <label>Account Status</label>
                    <div class="input-group">
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" ReadOnly="true" />
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-success" OnClick="LinkButton1_Click">
                            <i class="fas fa-check-circle"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-warning" OnClick="LinkButton2_Click">
                            <i class="far fa-pause-circle"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-danger" OnClick="LinkButton3_Click">
                            <i class="fas fa-times-circle"></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>

            <!-- DOB + Contact + Email -->
            <div class="row mt-3">
                <div class="col-md-3">
                    <label>DOB</label>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="Date" ReadOnly="true" />
                </div>
                <div class="col-md-4">
                    <label>Contact No</label>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>
                <div class="col-md-5">
                    <label>Email</label>
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>
            </div>

            <!-- State + City + Zip -->
            <div class="row mt-3">
                <div class="col-md-4">
                    <label>State</label>
                    <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>
                <div class="col-md-4">
                    <label>City</label>
                    <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>
                <div class="col-md-4">
                    <label>Zip Code</label>
                    <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>
            </div>

            <!-- Address -->
            <div class="row mt-3">
                <div class="col-md-12">
                    <label>Full Address</label>
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" ReadOnly="true" />
                </div>
            </div>

            <!-- Delete -->
            <div class="row mt-3">
                <div class="col-md-12">
                    <asp:Button ID="Button5" runat="server" CssClass="btn btn-danger w-100" Text="Delete User Permanently" OnClick="Button5_Click" />
                </div>
            </div>

        </div>
    </div>
</div>

      

        <!-- RIGHT SIDE -->
        <div class="col-md-7">

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:elibrarydbConnectionString %>"
                SelectCommand="SELECT member_id, full_name, dob, contact_no, email, state, city, zipcode, full_address, account_status FROM member_master_tbl">
            </asp:SqlDataSource>

            <div class="card">
                <div class="card-body">

                    <h4 class="text-center">Member List</h4>
                    <hr />

                    <div class="table-responsive">
                        <asp:GridView ID="GridView1"
                            runat="server"
                            CssClass="table table-striped table-bordered"
                            AutoGenerateColumns="False"
                            DataKeyNames="member_id"
                            DataSourceID="SqlDataSource1">

                            <Columns>
                                <asp:BoundField DataField="member_id" HeaderText="ID" />
                                <asp:BoundField DataField="full_name" HeaderText="Name" />
                                <asp:BoundField DataField="account_status" HeaderText="Account Status" />
                                <asp:BoundField DataField="contact_no" HeaderText="Contact No" />
                                <asp:BoundField DataField="email" HeaderText="Email ID" />
                                <asp:BoundField DataField="state" HeaderText="State" />
                                <asp:BoundField DataField="city" HeaderText="City" />
                            </Columns>

                        </asp:GridView>
                    </div>

                </div>
            </div>

        </div>

    </div>
</div>

</asp:Content>
