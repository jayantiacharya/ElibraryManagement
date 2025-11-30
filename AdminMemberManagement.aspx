<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="WebApplication1.AdminMemberManagement" %>
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
                            <h4>Member Details</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col text-center">
                            <img width="150px" src="imgs/login.png" />
                        </div>
                    </div>

                    <hr />

                    <!-- Member ID + Full Name + Status -->
                    <div class="row">

                        <div class="col-md-3">
                            <label class="d-block w-100">Member ID</label>
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" runat="server" placeholder="Member ID"></asp:TextBox>
                                <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server">
                                    <i class="fas fa-check-circle"></i>
                                </asp:LinkButton>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label class="d-block w-100">Full Name</label>
                            <asp:TextBox CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="col-md-5">
                            <label class="d-block w-100">Account Status</label>
                            <div class="input-group mb-2">
                                <asp:TextBox CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>

                                <asp:LinkButton class="btn btn-success mr-1" ID="LinkButton1" runat="server">
                                    <i class="fas fa-check-circle"></i>
                                </asp:LinkButton>

                                <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButton2" runat="server">
                                    <i class="far fa-pause-circle"></i>
                                </asp:LinkButton>

                                <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton3" runat="server">
                                    <i class="fas fa-times-circle"></i>
                                </asp:LinkButton>
                            </div>
                        </div>

                    </div>

                    <!-- DOB + Contact + Email -->
                    <div class="row mt-3">
                        <div class="col-md-3">
                            <label class="d-block w-100">DOB</label>
                            <asp:TextBox CssClass="form-control" runat="server" TextMode="Date" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="col-md-4">
                            <label class="d-block w-100">Contact No</label>
                            <asp:TextBox CssClass="form-control" runat="server" TextMode="Number" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="col-md-5">
                            <label class="d-block w-100">Email ID</label>
                            <asp:TextBox CssClass="form-control" runat="server" TextMode="Email" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <!-- State + City + Pin -->
                    <div class="row mt-3">
                        <div class="col-md-4">
                            <label class="d-block w-100">State</label>
                            <asp:TextBox CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="col-md-4">
                            <label class="d-block w-100">City</label>
                            <asp:TextBox CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="col-md-4">
                            <label class="d-block w-100">Pin Code</label>
                            <asp:TextBox CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Address -->
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="d-block w-100">Full Postal Address</label>
                            <asp:TextBox CssClass="form-control" runat="server" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Delete Button -->
                    <div class="row mt-3">
                        <div class="col">
                            <asp:Button ID="Button4" CssClass="btn btn-danger btn-block btn-lg" runat="server" Text="Delete User Permanently" />
                        </div>
                    </div>

                </div>
            </div>

            <a href="Home.aspx"> >> Back to Home</a>
            <br /><br />
        </div>

        <!-- RIGHT SIDE -->
        <div class="col-md-7">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Member's List</h4>
                    <hr />
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered"></asp:GridView>
                </div>
            </div>
        </div>

    </div>
</div>



</asp:Content>
